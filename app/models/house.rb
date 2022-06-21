class House < ApplicationRecord
  include CleanImageUrl
  validates :name, :path, presence: true
  validates :name, uniqueness: { scope: :path }
  has_many :members, dependent: :destroy
  has_many :heads, dependent: :destroy
  has_many :distinctions, as: :record, dependent: :destroy
end
