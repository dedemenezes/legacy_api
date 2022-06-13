class House < ApplicationRecord
  validates :name, :path, presence: true
  validates :name, uniqueness: { scope: :path }
end
