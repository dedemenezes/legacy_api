class CreateWikis < ActiveRecord::Migration[6.1]
  def change
    create_table :wikis do |t|
      t.string :info
      t.string :url

      t.timestamps
    end
  end
end
