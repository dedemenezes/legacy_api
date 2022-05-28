class AddDiedUrlToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :died_url, :string
  end
end
