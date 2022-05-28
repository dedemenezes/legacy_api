class AddPathToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :path, :string
    add_column :characters, :path_url, :string
  end
end
