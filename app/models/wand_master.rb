# frozen_string_literal: true

class WandMaster < ApplicationRecord
  belongs_to :wand
  belongs_to :character

  def assign_master(hash)
    return unless hash.key?('masters')

    path = hash['masters'].first[:path]
    self.character = Character.find_by(path: path)
    self
  end

  def assign_wand(wand)
    self.wand = wand
  end
end
