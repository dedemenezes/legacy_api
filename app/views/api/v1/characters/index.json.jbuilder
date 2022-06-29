# frozen_string_literal: true

json.array! @records do |character|
  json.id character.id
  json.name character.name
  json.species character.species
  # json.species character.character_types do |char_type|
  #   json.id char_type.id
  #   json.name char_type.creature_type.name
  # end
  json.image_url character.image_url
end
