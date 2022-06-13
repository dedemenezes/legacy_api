# frozen_string_literal: true

class Wiki < ApplicationRecord
  validates :title, uniqueness: { scope: :path }
  scope :paths_for, proc { |e| where(base_type: e).pluck(:path) }
end
