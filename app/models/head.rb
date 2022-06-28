# frozen_string_literal: true

class Head < ApplicationRecord
  belongs_to :house
  belongs_to :header, class_name: 'Character'
  validates :house, uniqueness: { scope: :header }
end
