require_relative 'doc_builder'

class ListScraper
  def initialize(attributes = {})
    @doc = attributes[:doc]
    @url = attributes[:url]
  end

  def ordered_list_i_link
    @urls = []
    @doc.search('ol > li > i > a').each do |a_tag|
      @urls << HashBuilder.from_link(a_tag)
    end
    @urls
  end
end
