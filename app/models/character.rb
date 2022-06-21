# frozen_string_literal: true

class Character < ApplicationRecord
  has_one :wand_master, dependent: :destroy
  has_many :wand_owners, dependent: :destroy
  has_one :wand, through: :wand_master
  has_many :character_types, dependent: :destroy
  has_many :creature_types, through: :character_types
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :houses, through: :members
  # has_many :head_as_header, class_name: 'Heads', foreign_key: :header_id, dependent: :destroy
  # has_many :houses_as_head, through: :head_as_header

  validates :name, :path, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :path }

  def house
    houses.first
  end

  def self.houses_urls
    pluck(:house_url).uniq.compact.reject { |url| url.include?('#') }
  end

  def wands
    all_wands = wand_owners&.map(&:wand)
    if all_wands.first.present?
      all_wands&.push(wand).flatten
    else
      []
    end
  end
end
