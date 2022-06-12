# frozen_string_literal: true

class CreateCharacterTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :character_types do |t|
      t.references :character, null: false, foreign_key: true
      t.references :creature_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
