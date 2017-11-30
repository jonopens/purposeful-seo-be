require 'nokogiri'
require 'open-uri'
require 'time'

class Crawl < ApplicationRecord
	belongs_to :page
	has_many :insights, dependent: :destroy

	def scrape
		parent_page_url = "#{self.page.site.full_url}#{self.page.page_path}"
		opened_url = open(parent_page_url)
		scrape_hash = {
			:noko => Nokogiri::HTML(opened_url),
			:status_arr => opened_url.status
		}
		scrape_hash
	end

	def set_crawl_attributes
		scrape_data = self.scrape
		self.html_content = scrape_data[:noko]
		self.html_content = Crawl.clean_body(self.html_content)
		self.body_text = Crawl.clean_body(scrape_data[:noko].css('body').text)
		self.status_code = scrape_data[:status_arr][0].to_i
	end

	def set_parent_page_attributes
		noko = Nokogiri::HTML(self.html_content)

		self.page.text_to_html_ratio = self.calculate_text_to_html_ratio(noko)
		self.page.meta_desc          = noko.css("meta[name='description']")
		self.page.last_crawled       = Time.now
		self.page.title              = noko.css('title').text
		self.page.word_count              = self.find_word_count
		self.page.h1                 = self.make_node_array('h1', noko)
		self.page.h2                 = self.make_node_array('h2', noko)
	end

	def return_crawl_errors

	end

	def make_node_array(selector, noko)
		noko.css(selector).map { |n| n.text }
	end	

	def set_attributes
		self.set_crawl_attributes
		self.set_parent_page_attributes
	end

	def calculate_text_to_html_ratio(noko)
		text_length = Crawl.clean_body(noko.css('body').text).length
		all_chars_length = noko.inner_html.length

		(text_length / all_chars_length.to_f) * 100
	end

	def find_word_count
		self.body_text.split(' ').length
	end

	def self.clean_body(text)
	  text.gsub!(/(\r)?\n/, "")
  	text.gsub!(/\s+/, ' ')
  	text
	end

	def generate_insights
		#
		# SOME CODE HERE THAT LOOKS AT EACH PAGE VALUE AND DOES SOME SHIT
		#
	end

	# NOTE: method to remove MS Word tags, if necessary can be uncommented
	# 
	# def self.strip_bad_chars(text)
	#   text.gsub!(/"/, "'")
	#   text.gsub!(/\u2018/, "'")
	#   text.gsub!(/[”“]/, '"')
	#   text.gsub!(/’/, "'")
	#   text
	# end

end
