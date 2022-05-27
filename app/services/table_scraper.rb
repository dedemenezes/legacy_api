require 'pry-byebug'
class TableScraper

  def initialize(attributes = {})
    @path = attributes[:path]
    @html_doc = attributes[:doc] || get_doc
    @character_indexes = []
  end

  def all_urls_and_names
    @html_doc.search('.article-table').each do |table|
      from_table(table)
    end
    @character_indexes.compact!
  end

  def from_table(table)
    table.search('tr').each do |element|
      # binding.pry
      a_tag = element.first_element_child.children.first
      @character_indexes << a_tag_doc_to_hash(a_tag)
    end
  end

  def a_tag_doc_to_hash(nokogiri_a_tag)
    return if nokogiri_a_tag.text.match? /index/

    if nokogiri_a_tag.attr('href')
      { data: nokogiri_a_tag.attr('title'), path: nokogiri_a_tag.attr('href') }
    # else
    #   a = { data: a_tag.text }
    end
  end

  def urls
    @character_indexes.map { |hash| hash[:path] }
  end

  private

  def get_doc
    @html_doc = DocBuilder.new(url: @path).build_nokogiri_doc_from_url
  end
end
