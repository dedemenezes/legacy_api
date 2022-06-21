class CreateHeads < ActiveRecord::Migration[6.1]
  def change
    create_table :heads do |t|
      t.references :house, null: false, foreign_key: true
      t.references :header, foreign_key: { to_table: :characters }

      t.timestamps
    end
  end
end
