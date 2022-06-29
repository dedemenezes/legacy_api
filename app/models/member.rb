# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :house, counter_cache: true
  belongs_to :character
  validates :house, uniqueness: { scope: :character }
end
