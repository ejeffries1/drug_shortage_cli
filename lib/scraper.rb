require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  
  def self.current_drugs
  html = open("https://www.ashp.org/Drug-Shortages/Current-Shortages/Drug-Shortages-List?page=CurrentShortages")
  doc = Nokogiri::HTML(html)
  binding.pry
  end
  
end