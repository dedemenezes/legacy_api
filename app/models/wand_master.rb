# frozen_string_literal: true

class WandMaster < ApplicationRecord
  belongs_to :wand
  belongs_to :character
end
