# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.references :house, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
