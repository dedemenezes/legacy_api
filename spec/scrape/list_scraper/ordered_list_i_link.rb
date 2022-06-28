# frozen_string_literal: true

EXPECTED = [
  '/wiki/Harry_Potter_and_the_Philosopher%27s_Stone',
  '/wiki/Harry_Potter_and_the_Chamber_of_Secrets',
  '/wiki/Harry_Potter_and_the_Prisoner_of_Azkaban',
  '/wiki/Harry_Potter_and_the_Goblet_of_Fire',
  '/wiki/Harry_Potter_and_the_Order_of_the_Phoenix',
  '/wiki/Harry_Potter_and_the_Half-Blood_Prince',
  '/wiki/Harry_Potter_and_the_Deathly_Hallows'
].freeze

RSpec.describe 'Scraper::ListScraper', type: :service do
  VCR.use_cassette('book_series') do
    describe '#ordered_list_i_link' do
      # doc = WikiScraper.new(url: '/wiki/Harry_Potter_(book_series)').build_nokogiri_doc_from_url
      doc = Nokogiri::HTML(Faraday.get("#{Scraper::DocBuilder::BASE_URL}/wiki/Harry_Potter_(book_series)").body)
      scraper = Scraper::ListScraper.new(doc: doc)
      results = scraper.ordered_list_i_link

      it 'returns an array' do
        expect(results).to be_an(Array)
      end

      it 'build a hash for each result with keys title and path' do
        result = results.first
        expect(result.keys).to eq(%i[title path])
        result = results.last
        expect(result.keys).to eq(%i[title path])
      end

      it 'returns all urls' do
        expect(results.size).to eq(7)
        # urls = scraper.urls.map { _1[:url] }

        urls = results.map { |hash| hash[:path] }
        expect(urls).to eq(EXPECTED)
      end
    end
  end
end
