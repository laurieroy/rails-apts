# needs to be built out yet
require 'httparty'
require 'nokogiri'
require 'byebug'
# require 'hirb'

# watching 

# "https://www.indeed.com/"
# there is also a span.remote-bullet followed by span Remote. do a boolean
# 	url:
def scraper
	url = "https://www.indeed.com/jobs?q=Ruby%20on%20Rails&l&vjk=ac03f2f61f05d2b8"
	unparsed_page = HTTParty.get(url) if url

	parsed_page = Nokogiri::HTML(unparsed_page.body)
	jobs = Array.new
	job_listings = parsed_page.css('td.resultContent')
	
	# starting page
	page = 1
	# Get # of listings per page
	per_page =job_listings.size
	# Get total listings. 	super fragile clean up of the total
	totalListings = parsed_page.css('div#searchCountPages').text.split(' ')[3].gsub(',','').to_i
	last_page = (totalListings.to_f / per_page).round

	# Loop through pages see https://www.youtube.com/watch?v=b3CLEUBdWwQ&t=385s 26:30
	job_listings.each do |job_listing|
		job = {
			title: job_listing.css('div.singleLineTitle').text,
			company: job_listing.css('span.companyName').text,
			location: job_listing.css('div.companyLocation').text,
			rating: job_listing.css('span.ratingsDisplay').text,
			salary: job_listing.css('.salary-snippet-container').text
		}
		jobs << job
	end
	byebug
end
scraper