# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_artists, dependent: :destroy
  has_many :artists, through: :book_artists

  validates :title, uniqueness: { scope: :path, message: 'combination title and url already exist' }
end
