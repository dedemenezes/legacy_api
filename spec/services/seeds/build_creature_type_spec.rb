# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seeds::CreatureTypes::BuildCreatureType, type: :service do
  VCR.use_cassette('human') do
    describe '#from_path' do
      it 'create Human' do
        expect(CreatureType.count).to eq(0)
        subject = described_class.new(path: '/wiki/Human')
        subject.from_path
        expect(subject.creature_type).to eq(CreatureType.last)
      end
    end
  end
end
