# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "#cover_artists" do
    it 'returns all cover artists for book' do
      create(:babi_cover)
      subject = Book.last.cover_artists
      expect(subject.size).to eq(1)
      create(:prada_cover)
      subject = Book.last.cover_artists
      expect(subject.size).to eq(2)
      expect(subject).to all( be_an(Artist) )
    end
  end
end
