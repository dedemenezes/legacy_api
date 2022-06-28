# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Scraper::ListScraper', type: :service do
  VCR.use_cassette('hallows_character_index') do
    describe '#unordered_list_from_parent_node' do
      chars = [
        { title: 'Albino peacock', path: '/wiki/Albino_peacock' },
        { title: 'Pius Thicknesse', path: '/wiki/Pius_Thicknesse' },
        { title: 'Charity Burbage', path: '/wiki/Charity_Burbage' },
        { title: 'Percival Dumbledore', path: '/wiki/Percival_Dumbledore' },
        { title: 'Unidentified Mould-on-the-Wold boys', path: '/wiki/Unidentified_Mould-on-the-Wold_boys' }
      ]
      # builder = Scraper::DocBuilder.new(path: '/wiki/Harry_Potter_and_the_Deathly_Hallows_(character_index)')
      doc = Nokogiri::HTML(Faraday.get("#{Scraper::DocBuilder::BASE_URL}/wiki/Harry_Potter_and_the_Deathly_Hallows_(character_index)").body)
      results = Scraper::ListScraper.new(doc: doc).unordered_list_from_parent_node
      chars.each do |char|
        it "returns correct name and url for #{char[:title]}" do
          expect(char).to be_a(Hash)
          expect(results).to include(char)
        end
      end
    end
  end
end
