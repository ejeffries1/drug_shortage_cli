require_relative "../lib/scraper.rb"
#require_relative "../lib/environment.rb"
require "nokogiri"

class CommandLineInterface
  
  def run
    welcome
    choices
  end
  
  
  def welcome
    puts "Welcome to your command line drug shortage list!"
    puts "Please make a selection:"
    puts "1 - Current Drugs"
    puts "2 - Discontinued Drugs"
    puts "3 - Resolved Drug Shortages"
  end
  
  def choices
   input = gets.chomp!
   if input = "1"
    Scraper.current_drugs
    end
    
   if input = "2"
     Scraper.discontinued_drug
   end
  end
end