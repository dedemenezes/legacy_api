# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Character, type: :model do
  describe '#wands' do
    context 'no wands' do
      it 'do not raise error' do
        create(:harry)
        @subject = Character.last.wands
        expect { @subject }.not_to raise_error
      end

      it 'returns nil' do
        create(:harry)
        @subject = Character.last.wands
        expect(@subject).to eq(nil)
      end
    end

    context 'wand as master' do
      it 'returns an array of wand' do
        create(:harry)
        create(:wand_master)
        @subject = Character.last.wands
        expect(@subject).to be_an(Array)
        expect(@subject.first).to be_a(Wand)
      end
    end

    context 'wand as master and owner' do
      it 'returns all wands character is associated as master and owner' do
        create(:harry)
        create(:wand_master)
        create(:wand_owner)
        @subject = Character.last.wands
        expect(@subject).to all(be_a(Wand))
        expect(@subject.size).to eq(2)
      end
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
