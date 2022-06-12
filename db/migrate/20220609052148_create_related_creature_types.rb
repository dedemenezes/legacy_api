# frozen_string_literal: true

class CreateRelatedCreatureTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :related_creature_types do |t|
      t.references :main, foreign_key: { to_table: :creature_types }
      t.references :related, foreign_key: { to_table: :creature_types }

      t.timestamps
    end
  end
end
