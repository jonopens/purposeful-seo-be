require 'nokogiri'
require 'open-uri'
require 'time'

class Scraper

  attr_accessor :page, :status_code, :html_content

  def initialize(page)
    self.page = page
    self.status_code = nil
    self.html_content = nil
  end

  def scrape
    parent_page_url = "#{self.page.site.full_url}#{self.page.page_path}"
		begin
      opened_url = open(parent_page_url)
			opened_url_status = opened_url.status
		rescue OpenURI::HTTPError => error
			response = error.io
			opened_url_status = response.status
		ensure
			scrape_hash = {
				:noko => Nokogiri::HTML(opened_url),
				:status_arr => opened_url_status
			}
		end
		scrape_hash
	end

	def scrape_and_respond
		scrape_data = self.scrape
		self.status_code = scrape_data[:status_arr][0].to_i
		if self.status_code == 200
			self.respond_to_success(scrape_data[:noko])
			self.set_parent_page_attributes
		else
			self.respond_to_unsuccessful_scrape
		end
	end

	def respond_to_success(noko)
		self.html_content = noko.inner_html
		self.html_content = Scraper.clean_body(self.html_content)

		noko.css('script', 'style').remove
		self.page.body_text = Scraper.clean_body(noko.css('body').text)
		self.page.save
	end

	def respond_to_unsuccessful_scrape
		errors = 400..599
		redirects = 300..399

		if redirects.include?(self.status_code)
			self.page.redirect_on_last_crawl = true
		elsif errors.include?(self.status_code)
			self.page.error_on_last_crawl = true
		end
		self.page.save
	end

	def set_parent_page_attributes
		noko = Nokogiri::HTML(self.html_content)
    p    = self.page

    p.last_crawled       = Time.now
		p.text_to_html_ratio = self.calculate_text_to_html_ratio(noko)
    p.word_count         = self.find_word_count

    # check HTML for presence before assignment to circumvent errors
		if self.node_present?("meta[name='description']")
      p.meta_desc = noko.css("meta[name='description']").attribute('content').text
    else
      p.meta_desc = ''
    end
		p.title              = noko.css('title').text
		p.h1                 = self.make_node_array('h1', noko)
		p.h2                 = self.make_node_array('h2', noko)
		p.save
	end

	def make_node_array(selector, noko)
		noko.css(selector).map { |n| n.text }
	end

  # def attribute_setter(selector, key, noko, attr = nil)
  #   p = self.page
  #   if !!attr
  #     if self.node_present?(selector)
  #       p[key] = noko.css(selector).attribute(attr)
  #     else
  #       p[key] = ''
  #     end
  #   else
  #     self.node_present?(selector) ? p[key] = noko.css(selector) : p[key] = ''
  #   end
  # end

  def node_present?(selector)
    noko = Nokogiri::HTML(self.html_content)
    !noko.css(selector).empty?
  end

	def calculate_text_to_html_ratio(noko)
    body_text = noko.css('body').text
		text_length = Scraper.clean_body(body_text).length
		all_chars_length = noko.inner_html.length

		(text_length / all_chars_length.to_f) * 100
	end

	def find_word_count
		self.page.body_text.split(' ').length
	end

	def self.clean_body(text)
	  text.gsub!(/(\r)?\n/, " ")
  	text.gsub!(/\s+/, ' ')
  	text
	end

	# note > method to remove MS Word tags, if necessary can be uncommented

	# def self.strip_bad_chars(text)
	#   text.gsub!(/"/, "'")
	#   text.gsub!(/\u2018/, "'")
	#   text.gsub!(/[”“]/, '"')
	#   text.gsub!(/’/, "'")
	#   text
	# end

end
