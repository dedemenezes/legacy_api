# frozen_string_literal: true

class RenameCharacteristcsInWands < ActiveRecord::Migration[6.1]
  def change
    rename_column :wands, :characteristcs, :characteristics
  end
end
