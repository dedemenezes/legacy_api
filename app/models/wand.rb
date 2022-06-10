# frozen_string_literal: true

class Wand < ApplicationRecord
  has_one :wand_master, dependent: :destroy
  has_many :wand_owners, dependent: :destroy
  has_one :master, through: :wand_master, source: :character
  has_many :owners, through: :wand_owners, source: :character

  def self.generate_attribute_hash(infos)
    hsh = infos.map do |key, values|
      [[key.to_sym, values.first[:title]], ["#{key}_url".to_sym, values.first[:path]]]
    end
    hsh.map(&:to_h)
       .reduce(:merge)
       .compact
       .reject { _2.include? '#' }
       .select { |key, _v| Wand.new.attributes.keys.include? key.to_s }
       .reject { |key, _| has_association? key }
  end

  def self.has_association?(attribute)
    %i[owners masters masters_url].include? attribute
  end
end
