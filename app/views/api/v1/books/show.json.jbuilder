# frozen_string_literal: true

json.ignore_nil!
json.id @book.id
json.title @book.title
json.image_url @book.image_url
json.book_artists @book.book_artists do |book_artist|
  json.id book_artist.artist.id
  json.name book_artist.artist.name
  json.role book_artist.role
end
json.pages @book.pages
json.publisher @book.publisher
json.release_date @book.release_date
json.followed_by @book.followed_by
json.preceded_by @book.preceded_by
json.updated_at @book.updated_at
json.created_at @book.created_at
