require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  
  def self.current_drugs
  html = open("https://www.ashp.org/Drug-Shortages/Current-Shortages/Drug-Shortages-List?page=CurrentShortages")
  doc = Nokogiri::HTML(html)
    doc.css(".drug-shortage-container").each do |page|
      profile = page.css(".table table-striped main_table dataTable no-footer").text
    binding.pry
    end
  end
 
end