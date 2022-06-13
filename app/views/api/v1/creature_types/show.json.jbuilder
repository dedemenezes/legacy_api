json.id @creature_type.id
json.name @creature_type.name
json.eyes @creature_type.eyes
json.hair @creature_type.hair
json.native @creature_type.native
json.height @creature_type.height
json.length @creature_type.length
json.mortality @creature_type.mortality
json.distinctions @creature_type.distinctions do |distinction|
  json.id distinction.id
  json.content distinction.content
end
json.related_species do
  @creature_type.related_as_main do |related_creature_type|
    json.id related_creature_type.id
    json.name related_creature_type.name
  end
end
# json.pictures @creature_type.pictures
# json.characters @creature_type.characters
