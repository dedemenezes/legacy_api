# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_artists, dependent: :destroy
  has_many :artists, through: :book_artists

  validates :title, uniqueness: { scope: :path, message: 'combination title and url already exist' }

  # scope :cover_artists, -> { where(book_artist: { role: 'cover artist' }) }
  # scope :interior_artists, -> { book_artists.where(role: 'interior artist') }
end
