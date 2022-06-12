# frozen_string_literal: true

module Scraper
  # service to build default hash from any nokogiri a_tag
  # except if it's for any index page
  class HashBuilder
    def self.from_link(a_tag_doc)
      return if a_tag_doc.text.match?(/index/)

      return unless a_tag_doc.attr('href')

      { title: a_tag_doc.attr('title'), path: a_tag_doc.attr('href') }
    end
  end
end
