# frozen_string_literal: true

class AddImageUrlToHouses < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :image_url, :string
  end
end
