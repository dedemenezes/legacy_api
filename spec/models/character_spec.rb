# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Character, type: :model do
  describe '#right_attributes' do
    it 'returns right hash of attributes' do
      attributes = { name: 'Francis', wand: 'Wand' }
      actual = Character.right_attributes(attributes)
      expect(actual).to eq({ name: 'Francis' })
    end
  end
end
