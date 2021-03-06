# frozen_string_literal: true

module Scraper
  module BooksListAsHash
    def self.script
      proc do |path|
        doc_builder   = Scraper::DocBuilder.new path: path
        list_scraper  = Scraper::ListScraper.new(doc: doc_builder.html_doc)
        list_scraper.ordered_list_i_link
      end
    end
  end
end
