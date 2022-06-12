# frozen_string_literal: true

class CreatureType < ApplicationRecord
  has_many :related_as_main, class_name: 'RelatedCreatureType', foreign_key: :main_id, dependent: :destroy
  has_many :related_as_related, class_name: 'RelatedCreatureType', foreign_key: :related_id, dependent: :destroy
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :distinctions, dependent: :destroy
  has_many :character_types, dependent: :destroy
  has_many :characters, through: :character_types

  validates :name, :path, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :path }

  def self.find_by_name_or_path(type)
    CreatureType.find_by_name(type[:title]) || CreatureType.find_by_path(type[:path])
  end

  def only_one_distinction?
    distinctions.size == 1
  end

  def description
    if only_one_distinction?
      "#{name} is #{distinctions.first.content}"
    else
      start_minus_last = distinctions[...-1].map(&:content).join(',')
      last = distinctions[-1].content
      "#{name} is #{start_minus_last} and #{last}"
    end
  end
end
