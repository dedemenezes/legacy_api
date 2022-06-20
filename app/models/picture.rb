# frozen_string_literal: true

class Picture < ApplicationRecord
  validates :path, presence: true
  belongs_to :imageable, polymorphic: true
end
