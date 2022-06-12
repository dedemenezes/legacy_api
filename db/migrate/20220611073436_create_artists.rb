# frozen_string_literal: true

class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
