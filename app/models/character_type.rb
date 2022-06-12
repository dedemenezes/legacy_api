# frozen_string_literal: true

class CharacterType < ApplicationRecord
  belongs_to :character
  belongs_to :creature_type

  validates :character, uniqueness: { scope: :creature_type }
end
