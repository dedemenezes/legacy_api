class AddDetailsToWands < ActiveRecord::Migration[6.1]
  def change
    add_column :wands, :image, :string
    add_column :wands, :image_url, :string
  end
end
