


User.create(email: "jon@jon.com", username: "jonjon", password: "wooohooo", password_confirmation: "wooohooo", name: "Jon Openshaw")
User.create(email: "james@james.com", username: "jamjam", password: "wooohooo", password_confirmation: "wooohooo", name: "James Patterson")
User.create(email: "jane@jane.com", username: "janjan", password: "wooohooo", password_confirmation: "wooohooo", name: "Jane Eyre")
User.create(email: "jaime@jaime.com", username: "jaimjaim", password: "wooohooo", password_confirmation: "wooohooo", name: "Jaime Openshaw")

Site.create(domain_name: 'www.jonopens.com', protocol: 'http', full_url: 'http://www.jonopens.com', user_id: 1)
Site.create(domain_name: 'www.google.com', protocol: 'https', full_url: 'https://www.google.com', user_id: 1)
Site.create(domain_name: 'www.1stdibs.com', protocol: 'https', full_url: 'https://www.1stdibs.com', user_id: 1)
Site.create(domain_name: 'www.thebump.com', protocol: 'https', full_url: 'https://www.thebump.com', user_id: 1)
Site.create(domain_name: 'www.jonnylovesjaime.com', protocol: 'http', full_url: 'http://www.jonnylovesjaime.com', user_id: 4)
Site.create(domain_name: 'www.theknot.com', protocol: 'https', full_url: 'https://www.theknot.com', user_id: 2)
Site.create(domain_name: 'www.bustle.com', protocol: 'https', full_url: 'https://www.bustle.com', user_id: 3)




Page.create(
	site_id: 1, 
	page_path: '/blog/parsing-xml-sitemaps-with-nokogiri.html', 
	page_insight_status: "pending", 
	text_to_html_ratio: 41.99, 
	word_count: 742, 
	title: 'Parsing XML Sitemaps with Nokogiri & Open-URI in Ruby', 
	meta_desc: "I generally enjoy anything that can help out in scraping, and since I'm learning Ruby, I figured I'd give it a shot.", 
	h1: ['Parsing XML Sitemaps in Ruby with Nokogiri'], 
	h2: ['What is an XML Sitemap?', 'Reading Documentation Can Be a Shock', 'Getting Started with Nokogiri', '#css Method and Grabbing XML Sitemap URLs'], 
	last_crawled: '2017-11-24 13:16:46 -0500')
Page.create(
	site_id: 1, 
	page_path: '/blog/parsing-xml-sitemaps-with-nokogiri1.html', 
	page_insight_status: "pending", 
	text_to_html_ratio: 41.99, 
	word_count: 742, 
	title: 'Parsing XML Sitemaps with Nokogiri & Open-URI in Ruby', 
	meta_desc: "I generally enjoy anything that can help out in scraping, and since I'm learning Ruby, I figured I'd give it a shot.", 
	h1: ['Parsing XML Sitemaps in Ruby with Nokogiri'], 
	h2: ['What is an XML Sitemap?', 'Reading Documentation Can Be a Shock', 'Getting Started with Nokogiri', '#css Method and Grabbing XML Sitemap URLs'], 
	last_crawled: '2017-11-24 13:16:46 -0500')
Page.create(
	site_id: 1, 
	page_path: '/blog/parsing-xml-sitemaps-with-nokogiri2.html', 
	page_insight_status: "pending", 
	text_to_html_ratio: 41.99, 
	word_count: 742, 
	title: 'Parsing XML Sitemaps with Nokogiri & Open-URI in Ruby', 
	meta_desc: "I generally enjoy anything that can help out in scraping, and since I'm learning Ruby, I figured I'd give it a shot.", 
	h1: ['Parsing XML Sitemaps in Ruby with Nokogiri'], 
	h2: ['What is an XML Sitemap?', 'Reading Documentation Can Be a Shock', 'Getting Started with Nokogiri', '#css Method and Grabbing XML Sitemap URLs'], 
	last_crawled: '2017-11-24 13:16:46 -0500')
Page.create(
	site_id: 1, 
	page_path: '/blog/parsing-xml-sitemaps-with-nokogiri3.html', 
	page_insight_status: "pending", 
	text_to_html_ratio: 41.99, 
	word_count: 742, 
	title: 'Parsing XML Sitemaps with Nokogiri & Open-URI in Ruby', 
	meta_desc: "I generally enjoy anything that can help out in scraping, and since I'm learning Ruby, I figured I'd give it a shot.", 
	h1: ['Parsing XML Sitemaps in Ruby with Nokogiri'], 
	h2: ['What is an XML Sitemap?', 'Reading Documentation Can Be a Shock', 'Getting Started with Nokogiri', '#css Method and Grabbing XML Sitemap URLs'], 
	last_crawled: '2017-11-24 13:16:46 -0500')
Page.create(
	site_id: 1, 
	page_path: '/blog/parsing-xml-sitemaps-with-nokogiri4.html', 
	page_insight_status: "pending", 
	text_to_html_ratio: 41.99, 
	word_count: 742, 
	title: 'Parsing XML Sitemaps with Nokogiri & Open-URI in Ruby', 
	meta_desc: "I generally enjoy anything that can help out in scraping, and since I'm learning Ruby, I figured I'd give it a shot.", 
	h1: ['Parsing XML Sitemaps in Ruby with Nokogiri'], 
	h2: ['What is an XML Sitemap?', 'Reading Documentation Can Be a Shock', 'Getting Started with Nokogiri', '#css Method and Grabbing XML Sitemap URLs'], 
	last_crawled: '2017-11-24 13:16:46 -0500')

Comment.create(page_id: 1, user_id: 1, message: 'h2s could be better. need more data on the best keyterms on the page.' )