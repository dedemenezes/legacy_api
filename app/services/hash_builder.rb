class HashBuilder
  def self.from_link(a_tag_doc)
    return if a_tag_doc.text.match?(/index/)

    if a_tag_doc.attr("href")
      {title: a_tag_doc.attr("title"), path: a_tag_doc.attr("href")}
      # else
      #   a = { data: a_tag_doc.text }
    end
  end
end
