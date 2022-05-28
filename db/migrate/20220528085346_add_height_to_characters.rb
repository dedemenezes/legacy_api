# frozen_string_literal: true

class AddHeightToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :height, :string
  end
end
