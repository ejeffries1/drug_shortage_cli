require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :name, :drug
  
  @@all = {}
  #def initialize
    #@name = name
   # @@all[:name] = @name
  #end
  
  def self.current_drugs
  html = open("https://www.ashp.org/Drug-Shortages/Current-Shortages/Drug-Shortages-List?page=CurrentShortages")
  doc = Nokogiri::HTML(html)
    doc.css(".drug-shortage-container").select do |page|
      name = page.css("tr")
    binding.pry
    end
  end
 
end