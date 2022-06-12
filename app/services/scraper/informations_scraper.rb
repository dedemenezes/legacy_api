# frozen_string_literal: true

module Scraper
  # service used to parse all information located inside the box in any show page from harry potter fandom.
  # each section name from this box will be a key into the return hash.
  # each section value from this box will be a hash ({title: ?, path: ?}).
  # { key1: [value1, value2], key2: [...], ... }
  class InformationsScraper
    attr_reader :informations

    def initialize(attributes = {})
      @doc = attributes[:doc]
      @informations = {}
    end

    def scrape_information_box
      @doc.search('[data-source]').each do |section|
        values = scrape_information_section(section)

        attribute = section.attr('data-source')
        @informations[attribute] = values
      end
      # "pages"=>[{:title=>"223 ", :path=>nil}, {:title=>"309 ", :path=>nil}],
      informations['base type'] = [{ title: scrape_information_type, path: nil }]
      informations
    end

    def scrape_information_section(section)
      values = []
      parser = Scraper::InformationScraper.new(section)
      if parser.information_list.empty?
        values << parser.build_information_hash
      else
        list_items = parser.information_list.search('li')
        list_items.each do |value|
          values << Scraper::InformationScraper.new(value).build_information_hash
        end
      end
      values
    end

    def infos_titles_only
      @informations.transform_values { |values| values.map { |value| value[:title] } }
    end

    def scrape_information_type
      aside_section = 'aside.portable-infobox.pi-background.pi-border-color > section'
      h2 = 'h2.pi-item.pi-header.pi-secondary-font.pi-item-spacing.pi-secondary-background'
      return '' if @doc.search(aside_section)&.search(h2)&.empty?

      @doc.search("#{aside_section} > #{h2}").first.text.strip
    end
  end
end
