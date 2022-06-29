# frozen_string_literal: true

json.name @house.name
json.founder @house.founder
json.animal @house.animal
json.traits @house.traits_to_s
json.element @house.element
json.colors @house.colors
json.image_url @house.image_url
json.ghost @house.ghost
json.common_room @house.common_room
json.heads @house.heads do |head|
  json.id head.header.id
  json.name head.header.name
end
json.members @house.members.size
