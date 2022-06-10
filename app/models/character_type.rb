class CharacterType < ApplicationRecord
  belongs_to :character
  belongs_to :creature_type
end
