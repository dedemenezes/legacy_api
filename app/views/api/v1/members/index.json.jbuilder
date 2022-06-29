# frozen_string_literal: true

json.house @house.name
json.members @members do |member|
  json.id member.id
  json.name member.character.name
  json.image_url member.character.image_url
end
