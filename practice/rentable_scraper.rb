require 'open-uri'
require 'nokogiri'
require 'csv'

# url to scrape
url = "https://www.rentable.co/fargo-nd"

# parse page w/ Nokogiri
doc = Nokogiri::HTML(open(url))

# scrape the max number of pages, storing in max_page variable
# max_page = 0;
max_page = doc.css('span.js-search-grid-total').value;
 
# Initialize empty arrays
name = []
price = []
br = []

puts max_page
#  max_page class is Nokogiri::XML::NodeSet

# Loop once for each page of search results
# max_page.times do |i|

# 	# Open search results pagae
# 	url = "https://www.rentable.co/fargo-nd?page=#{i+1}"
# 	doc = Nokogiri::HTML(open(url))

# 	# Store data in arrays
# 	doc.css('div.grid-text.grid-property-name').each do |line|
# 		name << line.text
# 	end

# 	doc.css('div.full-width-height').each do |line|
# 		price << line.text
# 	end

# 	doc.css('div.beds-range').each do |line|
# 		br << line.text
# 	end

# 	# a for appends, w for write, overwriting anything already there
# 	CSV.open("rentable_listings.csv", "w") do |file|
# 		# Add a header
# 		file << ["Listing Name", "Price", "Bedrooms"]

# 		name.length.times do |i|
# 			file << [name[i], price[i], br[i]]
# 		end
# 	end
# end


