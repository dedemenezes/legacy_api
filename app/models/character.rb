# frozen_string_literal: true

class Character < ApplicationRecord
  has_one :wand_master, dependent: :destroy
  has_many :wand_owners, dependent: :destroy
  has_one :wand, through: :wand_master
  has_many :character_types, dependent: :destroy
  has_many :creature_types, through: :character_types
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :members
  has_many :houses, through: :members

  validates :name, :path, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :path }

  before_validation do
    CleanImageUrl.script.call(self)
  end

  def house
    houses.first
  end

  def self.houses_urls
    pluck(:house_url).uniq.compact
  end

  def wands
    all_wands = wand_owners&.map(&:wand)
    if all_wands.first.present?
      all_wands&.push(wand).flatten
    else
      []
    end
  end

  def self.generate_attribute_hash(infos)
    infos.map do |k, v|
      [[attribute_name(k).to_sym, v.first[:title]], ["#{attribute_name(k)}_url".to_sym, v.first[:path]]]
    end
         .map(&:to_h)
         .reduce(:merge)
         .compact
         .reject { _2.include? '#' }
  end

  def self.attribute_name(key)
    key == 'alias' ? 'nickname' : key
  end

  def self.right_attributes(hash)
    hash.select do |attribute, _|
      attribute = attribute.to_s if attribute.instance_of?(Symbol)
      new.attributes.keys.include? attribute
    end
  end
end
