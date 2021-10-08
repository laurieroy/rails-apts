task scrape: :environment do 
	puts "HERE"
	
	require "open-uri"

	url = "https://fargo.craigslist.org/search/apa?"

	doc = open(url).read
	parsed_content = Nokogiri::HTML(doc)

	listings = parsed_content.css('.content').css('li.result-row').each do |row|
		heading 			= row.css('.hdrlnk').first.inner_html.strip
		time_listed 	= row.css('time').first.attributes["datetime"].value
		hood 					= row.css('.result-hood').text.strip.tr('(', '').tr(')','').strip
		ext_link 			= row.css('.hdrlnk').first.attributes["href"].value
		price 				= row.css('.result-price').first.text.to_s.tr('$', '').tr(',', '').to_i



		# skip persisting if posting already exists in the db
		if Post.where(heading:heading, hood:hood, ext_link:ext_link).count <= 0
			Post.create(
				heading:			heading,
				time_listed:	time_listed,
				hood:					hood,
				ext_link:			ext_link,
				price:				price
			)
			puts "Added: #{heading ? heading : ""}"
		else
			puts "Skipped: #{heading ? heading : ""}"
		end

	end
end