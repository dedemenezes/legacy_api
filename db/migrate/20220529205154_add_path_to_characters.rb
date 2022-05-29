class AddPathToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :path, :string
  end
end
