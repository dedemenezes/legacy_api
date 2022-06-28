# frozen_string_literal: true

module Scraper
  class ListScraper
    def initialize(attributes = {})
      @doc = attributes[:doc]
      @url = attributes[:url]
    end

    def ordered_list_i_link
      @doc.search('ol > li > i > a').map do |a_tag|
        Scraper::HashBuilder.from_link(a_tag)
      end
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
