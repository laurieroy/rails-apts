# check robots.txt to see if scraping is allowed
# https://www.airbnb.com/robots.txt	seems to allow it as of 10/6/21
# https://nokogiri.org/#parsing-and-querying

require 'open-uri'
require 'nokogiri'
require 'csv'

url = "https://www.airbnb.com/s/Brooklyn--NY--United-States"
page = Nokogiri::HTML(open(url))

# page.css('[role="group"]').each do |line|
# 	puts line.text
# end
#  file << [name[i].to_s.gsub(/[0-9$]/,''), price[i], review[i]]
name=[]
page.css('div meta[itemprop="name"]').each do |line|
	name << line.text.strip
end

puts name
# a for appends, w for write, overwriting anything already there
# CSV.open("airbnb_listings.csv", "w") do |file|
# 	# Add a header
# 	file << ["Listing Name", "Price", "Details"]

# 	name.length.times do |i|
# 		file << [name[i], price[i], details[i]]
# 	end
# end
# puts div + div{style="--listing-card-media-border-radius:12px;"}
# His example had 

# QA data