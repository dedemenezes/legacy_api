require "rails_helper"

RSpec.describe InformationsScraper, type: :service do
  url = "https://harrypotter.fandom.com/wiki/Harry_Potter"
  nokogiri_doc = Nokogiri::HTML(Faraday.get(url).body)
  # nokogiri_doc = 'test'

  describe "#initialize" do
    info_box_scraper = InformationsScraper.new doc: nokogiri_doc
    it "with an empty informations hash" do
      actual = info_box_scraper.informations
      expect(actual).to be_a(Hash)
      expect(actual.size).to eq(0)
    end
  end

  describe "#scrape_information_box" do
    info_box_scraper = InformationsScraper.new doc: nokogiri_doc
    # {k => [values]}
    result = info_box_scraper.scrape_information_box
    # expected = {"image" => [{title: "Book Name", path: "https://book_name.png"}]}

    it "returns a hash for box section" do
      expect(result).to be_a(Hash)
    end

    it "returns all hash values as array" do
      expect(result["image"]).to be_an(Array)
    end

    it 'returns correct information type name' do
      expect(result[:base_type]).to eq("Biographical information")
    end
  end
end
