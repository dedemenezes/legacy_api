class House < ApplicationRecord
  include CleanImageUrl
  validates :name, :path, presence: true
  validates :name, uniqueness: { scope: :path }
  has_many :members, dependent: :destroy
end
