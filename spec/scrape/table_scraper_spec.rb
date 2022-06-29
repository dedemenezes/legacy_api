# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scraper::TableScraper, type: :service do
  VCR.use_cassette('book_one__character_index') do
    before(:each) do
      doc = Nokogiri::HTML(Faraday.get('https://harrypotter.fandom.com/wiki/Harry_Potter_and_the_Philosopher%27s_Stone_(character_index)').body)
      @table_scraper = Scraper::TableScraper.new doc: doc
    end

    describe '#all_urls_and_names' do
      it 'returns a hash for each index' do
        expect(@table_scraper.all_urls_and_names.first).to be_a(Hash)
        expect(@table_scraper.all_urls_and_names).to all(be_a(Hash))
      end

      it 'returns an array of characters index hashes' do
        expect(@table_scraper.all_urls_and_names).to be_an(Array)
      end
    end
    describe '#urls' do
      chars = %w[/wiki/Norberta /wiki/Charlie_Weasley%27s_colleagues /wiki/Ronan /wiki/Bane /wiki/Firenze /wiki/Unicorn]
      chars.each do |character_url|
        name = character_url[6..].tr('_', ' ')
        it "must include url for #{name}" do
          # expect(actual.only_urls).to include(character_url)
          @table_scraper.all_urls_and_names
          expect(@table_scraper.urls).to include(character_url)
        end
      end
    end
  end
end
