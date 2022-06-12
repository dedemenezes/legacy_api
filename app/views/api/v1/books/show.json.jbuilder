# frozen_string_literal: true

json.ignore_nil!
json.id @book.id
json.title @book.title
json.image_url @book.image_url
json.cover_artists @book.cover_artists do |artist|
  json.id artist.id
  json.name artist.name
end
json.author do
  json.id @book.author.id
  json.name @book.author.name
end
json.interior_artists @book.interior_artists do |artist|
  json.id artist.id
  json.name artist.name
end
json.narrators @book.narrators do |artist|
  json.id artist.id
  json.name artist.name
end
json.pages @book.pages
json.publisher @book.publisher
json.release_date @book.release_date
json.followed_by @book.followed_by
json.preceded_by @book.preceded_by
json.updated_at @book.updated_at
json.created_at @book.created_at
