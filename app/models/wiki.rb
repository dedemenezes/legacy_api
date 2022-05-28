# frozen_string_literal: true

class Wiki < ApplicationRecord
  validates :title, :path, uniqueness: true
end
