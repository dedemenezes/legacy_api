# frozen_string_literal: true

require 'rails_helper'
# require_relative '../../app/services/doc_builder'

RSpec.describe Scraper::CharacterIndexUrlScraper, type: :service do
  def builder(url)
    response = Net::HTTP.get_response(URI("#{Scraper::DocBuilder::BASE_URL}#{url}"))
    doc = Nokogiri::HTML(response.body)
    builder = Scraper::DocBuilder.new
    builder.html_doc = doc
    builder
  end

  VCR.use_cassette('philosopher_stone_show') do
    describe '#scrape' do
      it 'returns correct url' do
        # doc = Scraper::DocBuilder.new(path: book.path).html_doc
        # doc = Nokogiri::HTML(Faraday.get("#{Scraper::DocBuilder::BASE_URL}/wiki/Harry_Potter_and_the_Philosopher%27s_Stone").body)
        doc_builder = builder('/wiki/Harry_Potter_and_the_Philosopher%27s_Stone')
        cius = Scraper::CharacterIndexUrlScraper.new doc: doc_builder.html_doc
        actual = cius.scrape
        expect(actual).to eq('/wiki/Harry_Potter_and_the_Philosopher%27s_Stone_(character_index)')
      end
    end
  end
end
