json.array! @creature_types do |ct|
  json.id ct.id
  json.name ct.name
  json.native ct.native
  json.related_types ct.related_as_main.count
end
