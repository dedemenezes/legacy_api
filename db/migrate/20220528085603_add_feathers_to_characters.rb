class AddFeathersToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :feathers, :string
    add_column :characters, :feathers_url, :string
  end
end
