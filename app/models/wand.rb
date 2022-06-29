# frozen_string_literal: true

class Wand < ApplicationRecord
  has_one :wand_master, dependent: :destroy
  has_one :master, through: :wand_master, source: :character
  has_many :wand_owners, dependent: :destroy
  has_many :owners, through: :wand_owners, source: :character

  validates :name, :path, presence: true
  validates :path, uniqueness: { scope: :name }

  def master?
    master.present?
  end
end
