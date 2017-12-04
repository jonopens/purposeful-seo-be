class InsightGenerator

	attr_reader :page, :crawl

	def initialize(crawl)
		@crawl = crawl
		@page = Page.find(@crawl.page.id)
	end

	def generate_insights
		self.title_case_check
		self.h1_case_check
		self.meta_desc_case_check
		self.body_text_case_check
		self.text_html_ratio_case_check
	end

	def title_case_check
		title = self.page.title
		case 
		when title.length == 0
			Insight.create(
				crawl_id: self.crawl.id, 
				optimization_type: "title", 
				content: "Page has no title tag value. Add an optimized title tag to this page."
			)
		when title.length < 30
			Insight.create(
				crawl_id: self.crawl.id, 
				optimization_type: "title", 
				content: "Page's title tag is too short. Ideally, a title tag should be between 30 and 65 characters."
			)
		when title.length > 65
			Insight.create(
				crawl_id: self.crawl.id, 
				optimization_type: "title", 
				content: "Title tag is too long. Title tags longer than 65 characters should be shorter."
			)
		else
			return
		end
	end

	def h1_case_check
		h1s = self.page.h1
		case
		when h1s.length == 0
			Insight.create(
				crawl_id: self.crawl.id, 
				optimization_type: "h1", 
				content: "Each page should generally have an h1 tag on it. Try adding one to improve performance."
			)
		when h1s.length > 1
			Insight.create(
				crawl_id: self.crawl.id, 
				optimization_type: "h1", 
				content: "Pages should only have a single h1 tag to avoid confusion for search bots."
			)
		else
			return
		end
	end

	def meta_desc_case_check
		meta = self.page.meta_desc
		case
		when meta.length == 0
			Insight.create(
				crawl_id: self.crawl.id, 
				optimization_type: "meta description", 
				content: "This page needs a meta description. Meta descriptions can help drive click-through from SERPs."
			)
		when meta.length > 160
			Insight.create(
				crawl_id: self.crawl.id, 
				optimization_type: "meta description", 
				content: "The meta description for this page is too long. Search engines often don't display meta descriptions longer than 160 characters."
			)
		else
			return
		end
	end

	def body_text_case_check
		body = self.crawl.body_text
		case
		when body.length == 0
			Insight.create(
				crawl_id: self.crawl.id, 
				optimization_type: "body text", 
				content: "This page has no text. Search engines like keyword-rich text."
			)
		when body.length < 200
			Insight.create(
				crawl_id: self.crawl.id, 
				optimization_type: "body text", 
				content: "This page needs more text. It has fewer than 200 words."
			)
		else
			return
		end
	end

	def text_html_ratio_case_check
		text_html_ratio = self.page.text_to_html_ratio
		case
		when text_html_ratio == 0
			Insight.create(
				crawl_id: self.crawl.id, 
				optimization_type: "text to html ratio", 
				content: "This page should have some text on it. Without text, it's hard for search engines to understand what a page is about."
			)
		when text_html_ratio < 20
			Insight.create(
				crawl_id: self.crawl.id, 
				optimization_type: "text to html ratio", 
				content: "Consider adding more text content to this page. The ratio of text to HTML code is low."
			)
		else
			return
		end
	end

end