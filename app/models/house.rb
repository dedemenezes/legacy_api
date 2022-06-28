# frozen_string_literal: true

class House < ApplicationRecord
  include CleanImageUrl
  validates :name, :path, presence: true
  validates :name, uniqueness: { scope: :path }
  has_many :members, dependent: :destroy
  has_many :heads, dependent: :destroy
  has_many :distinctions, as: :record, dependent: :destroy

  def traits_to_s
    return '' if distinctions.empty?

    last = distinctions[-1].content
    start = distinctions[0...-1].map(&:content)
    distinctions.count > 1 ? "#{start.join(', ')} and #{last}" : distinctions.first.content
  end
end
