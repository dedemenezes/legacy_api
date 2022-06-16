json.house @house.name
json.members @members do |member|
  json.id member.id
  json.character do
    json.id member.character.id
    json.name member.character.name
    json.name member.character.name
  end
end
