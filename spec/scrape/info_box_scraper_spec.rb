require 'rails_helper'

RSpec.describe InfoBoxScraper, type: :service do
  describe '#initialize' do
    path = '/wiki/Harry_Potter'
    # doc = Nokogiri::HTML(Faraday.get(path).body)
    nokogiri_doc = 'test'
    info_box_scraper = InfoBoxScraper.new doc: nokogiri_doc
    it 'with an empty informations hash' do
      actual = info_box_scraper.informations
      expect(actual).to be_a(Hash)
      expect(actual.size).to eq(0)
    end
  end
end
