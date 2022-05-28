class CreateWands < ActiveRecord::Migration[6.1]
  def change
    create_table :wands do |t|
      t.string :manufacturer
      t.string :made
      t.string :wood
      t.string :core
      t.string :length
      t.string :characteristcs

      t.timestamps
    end
  end
end
