# frozen_string_literal: true

class CreateCreatureTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :creature_types do |t|
      t.string :name
      t.string :path
      t.string :eyes
      t.string :hair
      t.string :native
      t.string :height
      t.string :length
      t.string :mortality

      t.timestamps
    end
  end
end
