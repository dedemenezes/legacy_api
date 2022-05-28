# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :image
      t.string :name
      t.string :born
      t.string :blood
      t.string :marital
      t.string :nationality
      t.string :nickname
      t.string :species
      t.string :gender
      t.string :weight
      t.string :hair
      t.string :eyes
      t.string :skin
      t.string :family
      t.string :loyalty
      t.string :base_type

      t.timestamps
    end
  end
end
