class TableScraper
  def initialize(attributes = {})
    @path = attributes[:path]
    @html_doc = attributes[:doc] || get_doc
    @character_indexes = []
  end

  def all_urls_and_names
    @html_doc.search(".article-table").each do |table|
      from_table(table)
    end
    @character_indexes.compact!
  end

  def from_table(table)
    table.search("tr").each do |element|
      a_tag = element.first_element_child.children.first
      @character_indexes << HashBuilder.from_link(a_tag)
    end
  end

  def urls
    @character_indexes.map { |hash| hash[:path] }
  end

  private

  def get_doc
    @html_doc = DocBuilder.new(path: @path).html_doc
  end
end
