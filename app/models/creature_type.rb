class CreatureType < ApplicationRecord
  has_many :related_as_main, class_name: "RelatedCreatureType", foreign_key: :main_id
  has_many :related_as_related, class_name: "RelatedCreatureType", foreign_key: :related_id
  has_many :pictures, as: :imageable
  # CreatureType.third.related_creature_types.map { _1.related }
  has_many :distinctions

  validates :name, :path, uniqueness: true
end
