# frozen_string_literal: true

module Scraper
  class TableScraper
    def initialize(attributes = {})
      @path = attributes[:path]
      @html_doc = attributes[:doc] || get_doc
      @character_indexes = []
    end

    def all_urls_and_names
      @html_doc.search('.article-table').each do |table|
        table.search('tr').each do |element|
          a_tag = element.first_element_child.children.first
          @character_indexes << Scraper::HashBuilder.from_link(a_tag)
        end
      end
      @character_indexes.compact!
    end

    def urls
      @character_indexes.map { |hash| hash[:path] }
    end

    private

    def get_doc
      @html_doc = Scraper::DocBuilder.new(path: @path).html_doc
    end
  end
end