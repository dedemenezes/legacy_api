class CreatureType < ApplicationRecord
  has_many :related_as_main, class_name: "RelatedCreatureType", foreign_key: :main_id, dependent: :destroy
  has_many :related_as_related, class_name: "RelatedCreatureType", foreign_key: :related_id, dependent: :destroy
  has_many :pictures, as: :imageable
  # CreatureType.third.related_creature_types.map { _1.related }
  has_many :distinctions

  validates :name, :path, presence: true, uniqueness: true
end
