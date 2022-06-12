# frozen_string_literal: true

class CreateDistinctions < ActiveRecord::Migration[6.1]
  def change
    create_table :distinctions do |t|
      t.string :content
      t.references :creature_type, null: false, foreign_key: true
      t.references :related, foreign_key: { to_table: :creature_types }

      t.timestamps
    end
  end
end
