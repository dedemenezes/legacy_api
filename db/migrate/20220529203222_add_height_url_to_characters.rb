# frozen_string_literal: true

class AddHeightUrlToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :height_url, :string
  end
end
