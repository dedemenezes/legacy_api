class CreatureType < ApplicationRecord
  has_many :related_as_main, class_name: "RelatedCreatureType", foreign_key: :main_id, dependent: :destroy
  has_many :related_as_related, class_name: "RelatedCreatureType", foreign_key: :related_id, dependent: :destroy
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :distinctions, dependent: :destroy
  has_many :character_types, dependent: :destroy
  has_many :characters, through: :character_types

  validates :name, :path, presence: true, uniqueness: true

  def self.find_by_name_or_path(type)
    CreatureType.find_by_name(type[:title]) || CreatureType.find_by_path(type[:path])
  end
end
