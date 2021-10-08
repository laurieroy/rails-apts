# Obtain Heading body price neighborhood external link and timestamp from listings
# 
require "open-uri"
require "nokogiri"
require "csv"
require "pry"
require "byebug"
require "awesome_print"

# class Scraper
	# search_terms =[ ''], then loop through	query=#{search_term}
	# def scrape_fargo_url
		# Set url
		url = "https://fargo.craigslist.org/search/apa?"

		# Parse html
		doc = open(url).read
		parsed_content = Nokogiri::HTML(doc)

		post_titles 	= []
		post_timings 	= []
		post_hoods 		= []
		post_links 		= []
		post_prices 	= []
		# post_sizes 		= []

		listings = parsed_content.css('.content').css('li.result-row').each do |row|
			post_titles <<  row.css('.hdrlnk').first.inner_html.strip
			post_timings << row.css('time').first.attributes["datetime"].value
			post_hoods << row.css('.result-hood').text.strip.tr('(', '').tr(')','').strip
			post_links << row.css('.hdrlnk').first.attributes["href"].value
			post_prices << row.css('.result-price').first.text.to_s.tr('$', '').tr(',', '').to_i
			# post_sizes << row.css('.housing').text.split('\n').split(/ - /)
		end

	# end

	# Get number of pages
	# page = 1
	# per_page = listings.size
	# total_listings = parsed_content.css('span.totalCount').text
	# last_page = (total_listings.to_f / per_page).round



	#  apts
	# Specify request variables
	# params = {
	# 	# 0=available now, 1 = within 30 days, 2 = beyond 30 days
	# 	availability: "?availabilityMode=0",
	# 	date: "&sale_date=all+dates",
	# 	# within 60 miles of Fargo
	# 	# ?lat=46.877&lon=-96.79&search_distance=60
	# }

	# def write_csv
		# a for appends, w for write, overwriting anything already there
		CSV.open("far_craigsList_listings.csv", "w") do |file|
			# Add a header 			Removed , "Details" for now as not being able to split br and sq footage
			file << ["Listing Name", "Time Listed", "Neighborhood", "Link", "Price"]

			post_titles.length.times do |i|
				file << [post_titles[i], post_timings[i], post_hoods[i], post_links[i], post_prices[i]]
			end
		end
	# end





# end

# scraper = Scraper.new
# scraper.scrape_fargo_url
# scraper.write_csv