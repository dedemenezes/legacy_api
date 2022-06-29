# json.ignore_nil!
json.id @wand.id
json.name @wand.name
json.manufacturer @wand.manufacturer
json.made @wand.made
json.wood @wand.wood
json.core @wand.core
json.length @wand.length
json.characteristics @wand.characteristics
json.image_url @wand.image_url
json.master do
  if @wand.master?
    json.id @wand.master.id
    json.name @wand.master.name
  else
    json.nil!
  end
end
json.owners @wand.owners do |owner|
  json.id owner.id
  json.name owner.name
end
json.created_at @wand.created_at
json.updated_at @wand.updated_at
