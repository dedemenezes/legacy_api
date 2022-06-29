# frozen_string_literal: true

class BookArtist < ApplicationRecord
  belongs_to :book
  belongs_to :artist
  enum role: { cover_artist: 0, interior: 1, author: 2, narrator: 3 }
end
