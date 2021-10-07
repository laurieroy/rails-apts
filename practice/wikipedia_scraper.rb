require 'open-uri'
require 'nokogiri'

url = "https://en.wikipedia.org/wiki/List_of_current_NBA_team_rosters"
page = Nokogiri::HTML(open(url))

# puts page.css('li.toclevel-3')
page.css('td[style="text-align:left;"]').each do |line|
	puts line.text
end