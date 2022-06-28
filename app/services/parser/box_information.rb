# frozen_string_literal: true

module Parser
  # service used to parse all information located inside the box in any show page from harry potter fandom.
  # each section name from this box will be a key into the return hash.
  # each section value from this box will be a hash ({title: ?, path: ?}).
  # { key1: [value1, value2], key2: [...], ... }
  class BoxInformation
    attr_reader :informations

    def initialize(attributes = {})
      @doc = attributes[:doc]
      @informations = {}
      @box_section = Parser::BoxSection.new
    end

    def scrape_information_box
      @doc.search('[data-source]').each do |section|
        parse_section_to_informations_hash(section)
      end
      # "pages"=>[{:title=>"223 ", :path=>nil}, {:title=>"309 ", :path=>nil}],
      informations['base type'] = [{ title: scrape_information_type, path: nil }]
      informations
    end

    def parse_section_to_informations_hash(section)
      attribute = section.attr('data-source')
      @informations[attribute] = scrape_information_section(section)
    end

    def scrape_information_section(section)
      @box_section.doc = section
      return [@box_section.build_information_hash] unless @box_section.information_in_list?

      # list_items = @box_section.information_list.search('li')
      @box_section.list_items.map do |value|
        @box_section.doc = value
        @box_section.build_information_hash
      end
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

    def scrape_section_by_name(name)
      @doc.search("[data-source=#{name.downcase}]").each do |section|
        parse_section_to_informations_hash(section)
      end
    end

    def multiple_values_sections
      informations.select { |_, values| values.count > 1 }
    end
  end
end
