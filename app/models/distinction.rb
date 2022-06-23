# frozen_string_literal: true

class Distinction < ApplicationRecord
  # belongs_to :creature_type, optional: true
  belongs_to :record, polymorphic: true
  validates :content, presence: true, uniqueness: true
end
