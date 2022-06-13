  json.name @house.name
  json.founder @house.founder
  json.image_url @house.image_url
  json.animal @house.animal
  json.element @house.element
  json.ghost @house.ghost
  json.common_room @house.common_room
  json.members @house.members do |member|
    json.id member.character.id
    json.name member.character.name
  end
