# frozen_string_literal: true

class Scraper::HashBuilder
  def self.from_link(a_tag_doc)
    return if a_tag_doc.text.match?(/index/)

    return unless a_tag_doc.attr('href')

    { title: a_tag_doc.attr('title'), path: a_tag_doc.attr('href') }
  end

end
