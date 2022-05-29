# frozen_string_literal: true

class WandOwner < ApplicationRecord
  belongs_to :wand
  belongs_to :character
end
