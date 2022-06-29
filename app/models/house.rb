# frozen_string_literal: true

class House < ApplicationRecord
  include CleanImageUrl
  validates :name, :path, presence: true
  validates :name, uniqueness: { scope: :path }
  has_many :members, dependent: :destroy
  has_many :characters, through: :members
  has_many :heads, dependent: :destroy
  has_many :headers, through: :heads, source: :header
  has_many :distinctions, as: :record, dependent: :destroy

  def traits_to_s

    case distinctions.size
    when 0 then ''
    when 1 then distinctions.first.content
    else
      copy = distinctions.to_a
      last = copy.pop
      copy.join(', ').concat(" and #{last}")
    end
    # last = distinctions[-1].content
    # start = distinctions[0...-1].map(&:content)
    # distinctions.count > 1 ? "#{start.join(', ')} and #{last}" : distinctions.first.content
  end
end
