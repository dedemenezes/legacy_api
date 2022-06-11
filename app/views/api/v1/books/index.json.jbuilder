json.array! @books do |book|
  json.title book.title
  json.author book.author
  json.image_url book.image_url
  json.pages book.pages
  json.release_date book.release_date
end
