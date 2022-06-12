# frozen_string_literal: true

class RemoveWandFromCharacters < ActiveRecord::Migration[6.1]
  def change
    remove_column :characters, :wand, :string
  end
end
