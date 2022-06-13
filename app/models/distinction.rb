# frozen_string_literal: true

class Distinction < ApplicationRecord
  belongs_to :creature_type
  validates :content, presence: true
end
