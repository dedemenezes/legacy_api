# frozen_string_literal: true

class Character < ApplicationRecord
  has_one :wand_master, dependent: :destroy
  has_many :wand_owners, dependent: :destroy
  has_many :character_types, dependent: :destroy
  has_many :creature_types, through: :character_types
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :houses, through: :members
  has_many :head_as_header, class_name: 'Head', foreign_key: :header_id, dependent: :destroy
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
    return nil if wand_master.nil? && wand_owners.empty?

    [wand_master, wand_owners].flatten.map(&:wand)
  end
end
