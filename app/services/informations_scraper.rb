# frozen_string_literal: true

class InformationsScraper
  attr_reader :informations

  def initialize(attributes = {})
    @doc = attributes[:doc]
    @informations = {}
  end

  def scrape_information_box
    @doc.search('[data-source]').each do |information|
      values = []
      parser = InformationScraper.new(information)
      if parser.information_list.empty?
        values << parser.build_information_hash
      else
        list_items = parser.information_list.search('li')
        list_items.each do |element|
          item_parser = InformationScraper.new(element)
          values << item_parser.build_information_hash
        end
      end

      information_name = information.attr('data-source')
      @informations[information_name] = values
    end
    # "pages"=>[{:title=>"223 ", :path=>nil}, {:title=>"309 ", :path=>nil}],
    informations['base_type'] = [{ title: scrape_information_type, path: nil }]
    informations
  end

  def scrape_information_type
    aside_section = 'aside.portable-infobox.pi-background.pi-border-color > section'
    h2 = 'h2.pi-item.pi-header.pi-secondary-font.pi-item-spacing.pi-secondary-background'
    return '' if @doc.search(aside_section)&.search(h2)&.empty?

    @doc.search("#{aside_section} > #{h2}").first.text.strip
  end
end
