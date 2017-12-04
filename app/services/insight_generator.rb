class InsightGenerator

	def initialize(crawl)
		@crawl = crawl
		@page = Page.find(@crawl.page.id)
	end

	def generate_insights(page)

	end

	def title_case_check
		title = self.page.title
		case 
		when title.length == 0
			Insight.create()
		when title.length < 30

		when title.length > 70

		else
			return
		end
	end
end