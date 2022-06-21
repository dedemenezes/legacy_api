class AddColorsToHouses < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :colors, :string
  end
end
