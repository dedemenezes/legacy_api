# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#cover_artists' do
    it 'returns all cover artists for book' do
      create(:babi_cover)
      subject = Book.last.book_artists.cover_artist
      expect(subject.size).to eq(1)
      create(:prada_cover)
      subject = Book.last.book_artists.cover_artist
      expect(subject.size).to eq(2)
      expect(subject).to all(be_an(BookArtist))
    end
  end

  describe '#interior_artists' do
    it 'returns all interior artists for book' do
      create(:babi_interior)
      subject = Book.last.book_artists.interior
      expect(subject.size).to eq(1)
      create(:prada_interior)
      subject = Book.last.book_artists.interior
      expect(subject.size).to eq(2)
      expect(subject).to all(be_an(BookArtist))
    end
  end

  describe '#narrators' do
    it 'returns all interior artists for book' do
      create(:fryer_narrator)
      subject = Book.last.book_artists.narrator
      expect(subject.size).to eq(1)
      expect(subject).to all(be_an(BookArtist))
    end
  end

  describe '#author' do
    it 'returns author for book' do
      create(:jk_author)
      subject = Book.last.book_artists.author
      expect(subject.size).to eq(1)
      expect(subject).to all(be_an(BookArtist))
    end
  end
end
