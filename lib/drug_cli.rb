require_relative "../lib/scraper"
require "nokogiri"

class CommandLineInterface
  Scraper.current_drugs
end