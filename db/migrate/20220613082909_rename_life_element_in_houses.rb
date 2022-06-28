# frozen_string_literal: true

class RenameLifeElementInHouses < ActiveRecord::Migration[6.1]
  def change
    rename_column :houses, :life_element, :element
    rename_column :houses, :life_element_url, :element_url
  end
end
