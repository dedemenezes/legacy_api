# frozen_string_literal: true

class RenameSpecsieUrlInCharacters < ActiveRecord::Migration[6.1]
  def change
    rename_column :characters, :specsie_url, :species_url
  end
end
