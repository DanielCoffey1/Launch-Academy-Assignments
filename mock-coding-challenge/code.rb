require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = "https://github.com/trending?since=weekly"
  unparsed_page = HTTParty.get(url)
  #make a get request to url to get back raw html of that page
  parsed_page = Nokogiri::HTML(unparsed_page)
  byebug
  #parsing into a format we can then extract data out of
end
scraper
