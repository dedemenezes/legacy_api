class CreateSpells < ActiveRecord::Migration[6.1]
  def change
    create_table :spells do |t|
      t.string :image_url
      t.string :name
      t.string :incantation
      t.string :kind
      t.string :light
      t.string :effect
      t.string :base_type
      t.string :hand_url
      t.references :creator, foreign_key: { to_table: :wikis }

      t.timestamps
    end
  end
end
