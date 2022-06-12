# frozen_string_literal: true

class Scraper::InformationsScraper
  attr_reader :informations

  def initialize(attributes = {})
    @doc = attributes[:doc]
    @informations = {}
  end

  def scrape_information_box
    @doc.search('[data-source]').each do |information|
      values = []
      parser = Scraper::InformationScraper.new(information)
      if parser.information_list.empty?
        values << parser.build_information_hash
      else
        list_items = parser.information_list.search('li')
        list_items.each do |element|
          values << Scraper::InformationScraper.new(element).build_information_hash
        end
      end

      attribute = information.attr('data-source')
      @informations[attribute] = values
    end
    # "pages"=>[{:title=>"223 ", :path=>nil}, {:title=>"309 ", :path=>nil}],
    informations['base type'] = [{ title: scrape_information_type, path: nil }]
    informations
  end

  def infos_titles_only
    @informations.map { |info, values| [info, values.map { |value| value[:title] }]  }.to_h
  end

  def scrape_information_type
    aside_section = 'aside.portable-infobox.pi-background.pi-border-color > section'
    h2 = 'h2.pi-item.pi-header.pi-secondary-font.pi-item-spacing.pi-secondary-background'
    return '' if @doc.search(aside_section)&.search(h2)&.empty?

    @doc.search("#{aside_section} > #{h2}").first.text.strip
  end
end
