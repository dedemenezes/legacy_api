# frozen_string_literal: true

class AddDiedToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :died, :string
  end
end
