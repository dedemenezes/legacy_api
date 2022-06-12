# frozen_string_literal: true

class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :path
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
