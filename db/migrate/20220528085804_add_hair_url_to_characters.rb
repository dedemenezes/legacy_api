# frozen_string_literal: true

class AddHairUrlToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :hair_url, :string
  end
end
