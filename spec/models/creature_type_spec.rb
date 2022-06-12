# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreatureType, type: :model do
  describe '#only_one_distinction?' do
    it 'returns expected boolean' do
      create(:distinction)
      expect(CreatureType.last.only_one_distinction?).to eq(true)
      create(:distinction_two)
      expect(CreatureType.last.only_one_distinction?).to eq(false)
    end
  end

  describe '#description' do
    context 'one distinction' do
      it 'returns right description' do
        create(:distinction)
        expect(CreatureType.last.description).to eq('Human is Not nice to enviroment')
      end
    end
    context 'many distinctions' do
      it 'returns right description' do
        create(:distinction)
        create(:distinction_two)

        expect(CreatureType.last.description).to eq('Human is Not nice to enviroment and living on Earth')
      end
    end
  end
end
