require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :drug
  
  @@all = []
  #def initialize
    #@drug = drug
   # @@all[:name] = @name
   #@@all << self
  #end
  
  def self.current_drugs
    drugs = []
  html = open("https://www.ashp.org/Drug-Shortages/Current-Shortages/Drug-Shortages-List?page=CurrentShortages")
  doc = Nokogiri::HTML(html)
    doc.css(".drug-shortage-container").each do |page|
      new_page = page.css("tr")
      drugs << new_page
      drugs.select do |i|
       new_drugs = i.text.split("\t")
       
       new_drugs.each do |element|
         new_drugs.delete(element) if element == """"
        end
        new_drugs.each do |list|
          puts list.strip
        end
      end
    end
  end
  
  def self.discontinued_drug
    html = open("https://www.ashp.org/Drug-Shortages/Current-Shortages/Drug-Shortages-List?page=DrugsNoLongerAvailable")
    doc = Nokogiri::HTML(html)
  end
 
end