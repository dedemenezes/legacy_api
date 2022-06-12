# frozen_string_literal: true

require 'rails_helper'
# require_relative '../../app/services/doc_builder'

RSpec.describe CharacterIndexUrlScraper, type: :service do
  describe '#scrape' do
    it 'returns correct url' do
      book = create :book_one
      doc = Scraper::DocBuilder.new(path: book.path).html_doc
      cius = CharacterIndexUrlScraper.new doc: doc
      actual = cius.scrape
      expect(actual).to eq('/wiki/Harry_Potter_and_the_Philosopher%27s_Stone_(character_index)')
    end
  end
end
