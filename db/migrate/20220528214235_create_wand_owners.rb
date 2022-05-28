class CreateWandOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :wand_owners do |t|
      t.references :wand, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
