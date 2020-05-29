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
    curr_drugs = []
  html = open("https://www.ashp.org/Drug-Shortages/Current-Shortages/Drug-Shortages-List?page=CurrentShortages")
  doc = Nokogiri::HTML(html)
    doc.css(".drug-shortage-container").each do |page|
      new_page = page.css("tr")
      curr_drugs << new_page
      curr_drugs.select do |i|
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
  
  def self.discontinued_drugs
    dis_drugs = []
    html = open("https://www.ashp.org/Drug-Shortages/Current-Shortages/Drug-Shortages-List?page=DrugsNoLongerAvailable")
    doc = Nokogiri::HTML(html)
    doc.css(".drug-shortage-container").each do |page|
      new_page = page.css("tr")
      dis_drugs << new_page
      dis_drugs.select do |i|
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
  
  def self.resolved_drugs
    res_drugs = []
    html = open("https://www.ashp.org/Drug-Shortages/Current-Shortages/Drug-Shortages-List?page=ResolvedShortages")
    doc = Nokogiri::HTML(html)
    doc.css(".drug-shortage-container") do |page|
      new_page = page.css("tr")
      res_drugs << new_page
      res_drugs.select do |i|
        new_drugs = i.text.split("\t")
        new_drugs.each do |element|
          new_drugs.delete(element) if element == """"
          end
          new_drugs.each do |i|
          end
        end
      end
    end
  end
 
end