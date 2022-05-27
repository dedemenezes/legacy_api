require_relative "information_scraper"

class InformationsScraper
  attr_reader :informations

  def initialize(attributes = {})
    @doc = attributes[:doc]
    @informations = {}
  end

  def scrape_information_box
    @doc.search("[data-source]").each do |information|
      values = []
      parser = InformationScraper.new(information)
      if parser.information_list.empty?
        values << parser.build_information_hash
      else
        list_items = parser.information_list.search("li")
        list_items.each do |element|
          item_parser = InformationScraper.new(element)
          values << item_parser.build_information_hash
        end
      end

      information_name = information.attr("data-source")
      @informations[information_name] = values
    end
    informations
  end
end
