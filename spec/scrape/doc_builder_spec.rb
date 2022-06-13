# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scraper::DocBuilder, type: :service do
  VCR.use_cassette('book_series') do
    describe '#initialize' do
      doc = Nokogiri::HTML(Faraday.get("#{Scraper::DocBuilder::BASE_URL}/wiki/Harry_Potter_(book_series)").body)
      context 'when passed url' do
        it 'create an accessible html_doc' do
          doc = Scraper::DocBuilder.new(doc: doc)
          expect { doc.html_doc }.not_to raise_error
        end
      end
    end
  end

  describe '#doc_has_table?' do
    VCR.use_cassette('philosopher_stone_character_index') do
      it 'returns true when wanted information organized as table' do
        doc_builder = builder('/wiki/Harry_Potter_and_the_Philosopher%27s_Stone_(character_index)')
        actual = doc_builder.doc_has_table?
        expect(actual).to be_truthy
      end
    end

    VCR.use_cassette('hallows_character_index') do
      it 'returns false when wanted information organized as list' do
        doc_builder = builder('/wiki/Harry_Potter_and_the_Deathly_Hallows_(character_index)')
        actual = doc_builder.doc_has_table?
        expect(actual).to be_falsey
      end
    end
  end

  def builder(url)
    response = Net::HTTP.get_response(URI("#{Scraper::DocBuilder::BASE_URL}#{url}"))
    doc = Nokogiri::HTML(response.body)
    builder = Scraper::DocBuilder.new
    builder.html_doc = doc
    builder
  end
end
