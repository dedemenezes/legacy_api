class CreatureType < ApplicationRecord
  has_many :related_as_main, class_name: "RelatedCreatureType", foreign_key: :main_id
  has_many :related_as_related, class_name: "RelatedCreatureType", foreign_key: :related_id
  # CreatureType.third.related_creature_types.map { _1.related }
  has_many :distinctions
end
