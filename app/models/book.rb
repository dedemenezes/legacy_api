# frozen_string_literal: true

class Book < ApplicationRecord

  has_many :book_artists, dependent: :destroy
  has_many :artists, through: :book_artists

  validates :title, uniqueness: { scope: :path, message: 'combination title and url already exist' }

  before_validation do
    CleanImageUrl.script.call(self)
  end

  def author
    Artist.joins(:book_artists).find_by(book_artists: { book: self, role: :author })
  end

  def cover_artists
    Artist.joins(:book_artists).where(book_artists: { book: self, role: :cover_artist })
  end

  def interior_artists
    Artist.joins(:book_artists).where(book_artists: { book: self, role: :interior })
  end

  def narrators
    Artist.joins(:book_artists).where(book_artists: { book: self, role: :narrator })
  end
end
