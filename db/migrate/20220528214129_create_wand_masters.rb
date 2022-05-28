class CreateWandMasters < ActiveRecord::Migration[6.1]
  def change
    create_table :wand_masters do |t|
      t.references :wand, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
