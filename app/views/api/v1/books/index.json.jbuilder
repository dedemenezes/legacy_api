# frozen_string_literal: true

json.array! @books do |book|
  json.id book.id
  json.title book.title
  json.image_url book.image_url
  json.author book.author.name
  json.release_date book.release_date
end
