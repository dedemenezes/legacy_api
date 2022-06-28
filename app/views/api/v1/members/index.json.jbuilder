# frozen_string_literal: true

json.house @house.name
json.members @members do |member|
  json.id member.id
  json.name member.character.name
end
