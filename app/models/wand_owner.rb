class WandOwner < ApplicationRecord
  belongs_to :wand
  belongs_to :character
end
