require "rails_helper"
# require 'nokogiri'

RSpec.describe "ListScraper", type: :service do
  describe "#ordered_list_i_link" do
    # doc = WikiScraper.new(url: '/wiki/Harry_Potter_(book_series)').build_nokogiri_doc_from_url
    doc = Nokogiri::HTML(Faraday.get("https://harrypotter.fandom.com/wiki/Harry_Potter_(book_series)").body)
    scraper = ListScraper.new(doc: doc)
    results = scraper.ordered_list_i_link
    it "returns an array" do
      expect(results).to be_an(Array)
    end

    it "build a hash for each result with keys title and path" do
      result = results.first
      expect(result.keys).to eq([:title, :path])
      result = results.last
      expect(result.keys).to eq([:title, :path])
    end

    it "returns all urls" do
      expect(results.size).to eq(7)
      # urls = scraper.urls.map { _1[:url] }
      expected = [
        "/wiki/Harry_Potter_and_the_Philosopher%27s_Stone",
        "/wiki/Harry_Potter_and_the_Chamber_of_Secrets",
        "/wiki/Harry_Potter_and_the_Prisoner_of_Azkaban",
        "/wiki/Harry_Potter_and_the_Goblet_of_Fire",
        "/wiki/Harry_Potter_and_the_Order_of_the_Phoenix",
        "/wiki/Harry_Potter_and_the_Half-Blood_Prince",
        "/wiki/Harry_Potter_and_the_Deathly_Hallows"
      ]
      urls = results.map { |hash| hash[:path] }
      expect(urls).to eq(expected)
    end
  end

  describe '#unordered_list_from_parent_node' do
    chars = [
      {title: "Albino peacock", path: "/wiki/Albino_peacock"},
      {title: "Pius Thicknesse", path: "/wiki/Pius_Thicknesse"},
      {title: "Charity Burbage", path: "/wiki/Charity_Burbage"},
      {title: "Percival Dumbledore", path: "/wiki/Percival_Dumbledore"},
      {title: "Unidentified Mould-on-the-Wold boys", path: "/wiki/Unidentified_Mould-on-the-Wold_boys"}
    ]
    builder = DocBuilder.new(path: "/wiki/Harry_Potter_and_the_Deathly_Hallows_(character_index)")
    results = ListScraper.new(doc: builder.html_doc).unordered_list_from_parent_node
    chars.each do |char|
      it "returns correct name and url for #{char[:title]}" do
        expect(char).to be_a(Hash)
        expect(results).to include(char)
      end
    end
  end
end
