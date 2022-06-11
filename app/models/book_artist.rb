class BookArtist < ApplicationRecord
  # ROLE = ['cover artist', 'interior artist']
  belongs_to :book
  belongs_to :artist
  validates :artist, uniqueness: { scope: :role }

  # enum status: { draft: 0, published: 1, archived: 2 }
  enum role: { cover_artist: 0, interior: 1, author: 2, narrator: 3 }

end
