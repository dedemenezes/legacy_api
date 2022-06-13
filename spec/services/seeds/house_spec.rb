# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seeds::Houses, type: :service do
  %w[Gryffindor Hufflepuff Ravenclaw Slytherin].each do |house_name|
    VCR.use_cassette(house_name.downcase) do
      describe '#run' do
        it 'returns successful request' do
          doc_builder = builder("/wiki/#{house_name}")
          expect(doc_builder).to respond_to(:html_doc).and be_truthy
        end
      end
    end
  end

  describe '#assign_member' do
    it 'assign a character to a house' do
      harry = create(:harry)
      gryffindor = create(:gryffindor)
      expect(Member.count).to eq(0)
      Seeds::Houses.new.assign_member(gryffindor, harry)
      expect(Member.count).to eq(1)
      expect(Member.last.character_id).to eq(harry.id)
      expect(Member.last.house_id).to eq(gryffindor.id)
    end
  end

  describe 'Seeds all four houses' do
    %w[Gryffindor Hufflepuff Ravenclaw Slytherin].each do |house_name|
      VCR.use_cassette(house_name.downcase) do
        it "create #{house_name} from given path" do
          create(:harry)
          create(:dede)
          create(:bamba)
          create(:babi_char)
          expect(House.count).to eq(0)
          Seeds::Houses.new.run
          expect(House.count).to eq(4)
          expect(House.find_by_name(house_name).name).to eq(house_name)
          expect(House.find_by_name(house_name).path).to eq("/wiki/#{house_name}")
          expect(Member.count).to eq(4)
        end
      end
    end
  end
end
