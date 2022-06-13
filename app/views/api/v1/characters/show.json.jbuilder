json.id @character.id
json.name @character.name
json.image_url @character.image_url
json.born @character.born
json.died @character.died
json.blood @character.blood
json.marital @character.marital
json.nationality @character.nationality
json.nickname @character.nickname
json.title @character.title
json.signature @character.signature
json.species @character.creature_types do |creature_type|
  json.id creature_type.id
  json.name creature_type.name
end
json.gender @character.gender
json.height @character.height
json.weight @character.weight
json.hair @character.hair
json.eyes @character.eyes
json.skin @character.skin
json.family @character.family
json.romances @character.romances
json.boggart @character.boggart
json.patronus @character.patronus
json.animagus @character.animagus
# unless @character.wands.first.nil?
  json.wand @character.wands do |wand|
    json.id wand.id
    json.name wand.name
  end
# end
json.job @character.job
json.house @character.house
json.loyalty @character.loyalty
json.feathers @character.feathers
json.created_at @character.created_at
