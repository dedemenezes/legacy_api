# frozen_string_literal: true

class AddAnimagusToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :animagus, :string
  end
end
