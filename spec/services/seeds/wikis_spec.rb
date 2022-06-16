# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seeds::Wikis, type: :service do
  VCR.use_cassette('philosopher_stone_character_index') do
    describe '#run' do
      context 'Wikis' do
        it 'populate database with wikis for first book' do
          create(:book_one)
          counter = Wiki.count
          expect(counter).to eq(0)
          Seeds::Wikis.run(1)
          expect(Wiki.count).to be > counter
        end
      end
    end
  end
end
