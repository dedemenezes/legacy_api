class Wiki < ApplicationRecord
  validates :title, :path, uniqueness: true
end
