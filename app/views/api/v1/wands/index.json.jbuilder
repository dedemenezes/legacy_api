# frozen_string_literal: true

json.array! @wands do |wand|
  # json.ignore_nil!
  json.id wand.id
  json.name wand.name
  json.wood wand.wood
  # json.core wand.core if wand.manufacturer.nil?
  # json.wood wand.wood if wand.manufacturer.nil? && wand.core.nil?
end
