# frozen_string_literal: true

class Character < ApplicationRecord
  has_one :wand_master, dependent: :destroy
  has_many :wand_owners, dependent: :destroy
  has_one :wand_as_master, through: :wand_master, source: :wand
  has_many :wands_as_owner, through: :wand_owners, source: :wand
  has_many :character_types, dependent: :destroy
  has_many :creature_types, through: :character_types
  has_many :pictures, as: :imageable, dependent: :destroy
  has_one :member, dependent: :destroy
  has_one :house, through: :member
  has_many :head_as_header, class_name: 'Head', foreign_key: :header_id, dependent: :destroy
  # has_many :houses_as_head, through: :head_as_header

  validates :name, :path, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :path }

  def self.houses_urls
    pluck(:house_url).uniq.compact.reject { |url| url.include?('#') }
  end

  def wands
    return nil if wand_master.nil? && wand_owners.empty?


    [wand_as_master, wands_as_owner].flatten
  end
end
