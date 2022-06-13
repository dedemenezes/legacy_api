# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_artists, dependent: :destroy
  has_many :artists, through: :book_artists

  validates :title, uniqueness: { scope: :path, message: 'combination title and url already exist' }

  before_validation do
    CleanImageUrl.script.call(self)
  end

  def author
    # Artist.joins(:book_artists).find_by(book_artists: { book: self, role: :author })
    book_artists.find_by(role: :author).artist
  end

  def cover_artists
    book_artists.where(role: :cover_artist).map(&:artist)
  end

  def interior_artists
    book_artists.where(role: :interior).map(&:artist)
    # Artist.joins(:book_artists).where(book_artists: { book: self, role: :interior })
  end

  def narrators
    book_artists.where(role: :narrator).map(&:artist)
    # Artist.joins(:book_artists).where(book_artists: { book: self, role: :narrator })
  end
end
