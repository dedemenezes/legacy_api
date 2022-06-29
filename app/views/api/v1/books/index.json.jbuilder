# frozen_string_literal: true

json.array! @books do |book|
  json.id book.id
  json.title book.title
  json.image_url book.image_url
  json.artists book.book_artists do |book_artist|
    if book_artist.role == 'author'
      json.author do
        json.id book_artist.artist.id
        json.name book_artist.artist.name
      end
    end
  end
  json.release_date book.release_date
end
