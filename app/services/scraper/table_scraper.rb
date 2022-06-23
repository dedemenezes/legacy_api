# frozen_string_literal: true

module Scraper
  class TableScraper
    def initialize(attributes = {})
      @path = attributes[:path]
      @html_doc = attributes[:doc]
      @characters_index = []
    end

    def all_urls_and_names
      @html_doc.search('.article-table').each do |table|
        table.search('tr').each do |element|
          a_tag = element.first_element_child.children.first
          @characters_index << Scraper::HashBuilder.from_link(a_tag)
        end
      end
      @characters_index.compact
    end

    def urls
      @characters_index.compact.map { |hash| hash[:path] }
    end
  end
end
