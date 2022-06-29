# frozen_string_literal: true

class AddWandToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :wand, :string
  end
end
