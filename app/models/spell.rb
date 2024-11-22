class Spell < ApplicationRecord
  belongs_to :creator, optional: true
end
