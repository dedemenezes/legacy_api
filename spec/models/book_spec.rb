# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#cover_artists' do
    it 'returns all cover artists for book' do
      create(:babi_cover)
      subject = Book.last.cover_artists
      expect(subject.size).to eq(1)
      create(:prada_cover)
      subject = Book.last.cover_artists
      expect(subject.size).to eq(2)
      expect(subject).to all(be_an(Artist))
    end
  end

  describe '#interior_artists' do
    it 'returns all interior artists for book' do
      create(:babi_interior)
      subject = Book.last.interior_artists
      expect(subject.size).to eq(1)
      create(:prada_interior)
      subject = Book.last.interior_artists
      expect(subject.size).to eq(2)
      expect(subject).to all(be_an(Artist))
    end
  end

  describe '#narrators' do
    it 'returns all interior artists for book' do
      create(:fryer_narrator)
      subject = Book.last.narrators
      expect(subject.size).to eq(1)
      expect(subject).to all(be_an(Artist))
    end
  end

  describe '#author' do
    it 'returns author for book' do
      create(:jk_author)
      subject = Book.last.author
      expect(subject).to be_an(Artist)
      expect(subject).to eq(Artist.last)
    end
  end
end
