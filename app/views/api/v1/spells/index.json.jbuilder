# frozen_string_literal: true

json.array! @records do |spell|
  json.id spell.id
  json.name spell.name
  # json.image_url spell.image_url
end
