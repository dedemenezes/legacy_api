# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RetrieveUrls, type: :service do
  describe '#self.script' do
    it 'returns only urls for Character attribute' do
      create(:harry)
      subject = RetrieveUrls.script(:character, :species_url)
      expect(subject.size).to eq(1)
      create(:dede)
      subject = RetrieveUrls.script(:character, :species_url)
      expect(subject.size).to eq(2)
    end
  end
end
