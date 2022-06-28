# frozen_string_literal: true

require 'rails_helper'

RSpec.describe House, type: :model do
  describe '#traits_to_s' do
    it 'returns all distinctions in the right sentence style' do
      create(:gryffindor)
      expect(described_class.first.traits_to_s).to eq('')
      create(:house_trait)
      expect(described_class.first.traits_to_s).to eq('Trait 1')
      2.times { create(:house_trait) }
      expect(described_class.first.traits_to_s).to eq('Trait 1, Trait 2 and Trait 3')
    end
  end
end
