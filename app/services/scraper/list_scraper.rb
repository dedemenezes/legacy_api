# frozen_string_literal: true

module Scraper
  class ListScraper
    def initialize(attributes = {})
      @doc = attributes[:doc]
      @url = attributes[:url]
    end

    def ordered_list_i_link
      @urls = []
      @doc.search('ol > li > i > a').each do |a_tag|
        @urls << Scraper::HashBuilder.from_link(a_tag)
      end
      @urls
    end

    def unordered_list_from_parent_node
      @urls = []
      @doc.search('.mw-headline').each do |span|
        span.parent.next_element.search('li > a').each do |link|
          @urls << Scraper::HashBuilder.from_link(link)
        end
      end
      @urls
    end
  end
end
