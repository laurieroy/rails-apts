This project is the first time I've used ruby to scrape web pages. It's currently at a functional state, but I'll continue to revise.

Data for apartments are scraped from craiglist and saved to a csv file.

My Process:

- Access a webpage's HTML (using open-uri or httparty, nokogiri )
- Identify proper css selectors for parsing through data by inspecting the page
- Write a Ruby script to scrape Wikipedia and Airbnb and export the information into a database. (using csv)

- TODO:

  - Clean up the apartment size input

  - Iterate over pages

  - Clean up the file

This is from a ~2014 [Baserail tutorial](https://baserails.com/webscraper).

AirBNB now uses React, so it's more difficult to scrape.

Acknowledgments: I used several resources to get to this point, most noteably: Alex Yang, zayne.io, Jennifer Ingram.

Read Later:
Data piplines: https://coreym.info/data-pipelines-in-ruby-on-rails/
Kimurai example - to do AirBNB: https://www.botreetechnologies.com/blog/how-to-do-web-scraping-of-a-static-or-dynamic-website-with-ruby-on-rails/
See this one for building out the indeed: https://towardsdatascience.com/job-board-scraping-with-rails-872c432ed2c8
