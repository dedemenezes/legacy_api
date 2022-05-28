# frozen_string_literal: true

class CharacterIndexUrlScraper
  def initialize(attributes = {})
    @doc = attributes[:doc]
  end

  def scrape
    index_url = ""
    ul = @doc.search("span#See_also.mw-headline").first.parent.next.next
    ul.search("a").each do |li|
      index_url = li.attr("href") if li.attr("title").match?(/index/)
    end
    index_url
  end
end
