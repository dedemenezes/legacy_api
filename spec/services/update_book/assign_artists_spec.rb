# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateModel::AssignArtists, type: :service do
  describe '#assign_artist' do
    context 'author' do
      before do
        create(:book_one)
      end
      it 'assign an existing artist as author to a book' do
        create(:jk)
        artist_hash = { title: 'JK Rowling', path: '/wiki/jk' }
        expect(BookArtist.count).to eq(0)
        UpdateModel::AssignArtists.assign_artist(artist_hash, :author, Book.last)
        expect(BookArtist.count).to eq(1)
        expect(BookArtist.last.role).to eq('author')
      end

      it 'creates and assign new artist as author to a book' do
        expect(BookArtist.count).to eq(0)

        artist_hash = { title: 'JK Rowling', path: '/wiki/jk' }
        UpdateModel::AssignArtists.assign_artist(artist_hash, :author, Book.last)

        expect(BookArtist.count).to eq(1)
        expect(Artist.count).to eq(1)
        expect(BookArtist.last.role).to eq('author')
      end
    end
  end
end
