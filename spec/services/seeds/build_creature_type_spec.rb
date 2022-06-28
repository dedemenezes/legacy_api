# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seeds::CreatureTypes::BuildCreatureType, type: :service do
  VCR.use_cassette('human') do
    before do
      @subject = described_class.new(path: '/wiki/Human')
    end
    describe '#from_path' do
      it 'create Human' do
        expect(CreatureType.count).to eq(0)
        @subject.from_path
        expect(@subject.creature_type).to eq(CreatureType.last)
      end
    end

    describe '#assign_distinction' do
      it 'assign distinctions to creature type' do
        expect(Distinction.count).to eq(0)
        @subject.infos
        @subject.build_instance
        # binding.pry
      end
    end
  end
end
