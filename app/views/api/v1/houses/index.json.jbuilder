json.array! @houses do |house|
  json.id house.id
  json.name house.name
  json.image_url house.image_url
  json.members house.members.count
end
