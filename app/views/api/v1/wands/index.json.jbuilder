json.array! @wands do |wand|
  json.id wand.id
  json.name wand.name
  json.path wand.path
  json.manufacturer wand.manufacturer
  json.made wand.made
  json.core wand.core
  json.length wand.length
  json.wood wand.wood
  json.characteristics wand.characteristics
  json.image wand.image
  json.image_url wand.image_url
  json.master wand.master.name
  json.owners wand.owners.count
  json.created_at wand.created_at
  json.updated_at wand.updated_at
end
