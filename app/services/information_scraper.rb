# frozen_string_literal: true

class InformationScraper
  def initialize(doc)
    @doc = doc
  end

  def build_information_hash
    data = information_content
    url = information_href
    {title: remove_unecessary_text(data), path: url}
  end

  def information_content
    return @doc.text.strip if @doc.name == "li"

    item = information_value.text.strip
    item = @doc.text.strip if item.empty?
    item = @doc.search("img").attr("data-image-name").value if item.empty?
    item
  end

  def information_value
    @doc.search(".pi-data-value")
  end

  def information_href
    href = @doc.search("a").attr("href")
    href&.value
  end

  def information_list
    information_value.search("ul")
  end

  def remove_unecessary_text(str)
    str.gsub(/(\[|\().+/, "")
  end
end
