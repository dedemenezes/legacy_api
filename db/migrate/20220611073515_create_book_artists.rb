# frozen_string_literal: true

class CreateBookArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :book_artists do |t|
      t.references :book, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
