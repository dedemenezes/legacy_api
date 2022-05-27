require_relative 'doc_builder'

class ListScraper
  def initialize(attributes = {})
    @doc = attributes[:doc]
    @url = attributes[:url]
  end

  def ordered_list_i_link
    @urls = []
    @doc.search('ol > li > i > a').each do |a_tag|
      @urls << { title: a_tag.attr('title'), path: a_tag.attr('href') }
    end
    @urls
  end
end
