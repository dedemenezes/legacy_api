# frozen_string_literal: true

require "rails_helper"

RSpec.describe TableScraper, type: :service do
  describe "#all_urls_and_names" do
    # doc = Nokogiri::HTML(Faraday.get('https://harrypotter.fandom.com/wiki/Harry_Potter_and_the_Philosopher%27s_Stone').body)
    table_scraper = TableScraper.new path: "/wiki/Harry_Potter_and_the_Philosopher%27s_Stone_(character_index)"
    chars = %w[/wiki/Norberta /wiki/Charlie_Weasley%27s_colleagues /wiki/Ronan /wiki/Bane /wiki/Firenze /wiki/Unicorn]
    actual = table_scraper.all_urls_and_names

    it "returns a hash for each index" do
      expect(actual.first).to be_a(Hash)
      expect(actual).to all(be_a(Hash))
    end

    it "returns an array of characters index hashes" do
      expect(actual).to be_an(Array)
    end

    chars.each do |character_url|
      name = character_url[6..].tr("_", " ")
      it "must include url for #{name}" do
        # expect(actual.only_urls).to include(character_url)
        expect(table_scraper.urls).to include(character_url)
      end
    end
  end
end
