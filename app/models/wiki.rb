# frozen_string_literal: true

class Wiki < ApplicationRecord
  validates :title, uniqueness: { scope: :path }
end
