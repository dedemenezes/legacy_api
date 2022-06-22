# frozen_string_literal: true

class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :path
      t.string :founder
      t.string :founder_url
      t.string :animal
      t.string :animal_url
      t.string :life_element
      t.string :life_element_url
      t.string :ghost
      t.string :ghost_url
      t.string :common_room
      t.string :common_room_url

      t.timestamps
    end
  end
end
