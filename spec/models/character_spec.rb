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

  describe '#houses_urls' do
    it 'returns only houses path' do
      create(:dede)
      create(:bamba)
      create(:babi_char)
      create(:muggle)
      expect(Character).to respond_to(:houses_urls)
      expect(Character.houses_urls).to be_an(Array)
      expect(Character.houses_urls.size).to eq(3)
    end
  end
end
