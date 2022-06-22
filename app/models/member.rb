# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :house
  belongs_to :character
  validates :house, uniqueness: { scope: :character }
end
