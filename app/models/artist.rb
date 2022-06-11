class Artist < ApplicationRecord
  has_many :book_artists, dependent: :destroy
  has_many :books, through: :book_artists

  validates :name, uniqueness: { scope: :path }

  def self.find_by_name_or_path(artist_hash)
    Artist.find_by(name: artist_hash[:title]) || Artist.find_by(path: artist_hash[:path])
  end
end
