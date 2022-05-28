class AddPathToWands < ActiveRecord::Migration[6.1]
  def change
    add_column :wands, :path, :string
  end
end
