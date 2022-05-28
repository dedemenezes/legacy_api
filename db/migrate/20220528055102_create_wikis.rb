class CreateWikis < ActiveRecord::Migration[6.1]
  def change
    create_table :wikis do |t|
      t.string :title
      t.string :path

      t.timestamps
    end
  end
end
