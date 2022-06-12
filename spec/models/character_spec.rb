# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Character, type: :model do
  describe '#wands' do
    it 'returns all wands character is associated as master and/or owner' do
      create(:wand_master)
      create(:wand_owner)
      subject = Character.last.wands
      expect(subject).to be_an(Array)
      expect(subject).to all(be_an(Wand))
      expect(subject.size).to eq(2)
    end
  end
end
