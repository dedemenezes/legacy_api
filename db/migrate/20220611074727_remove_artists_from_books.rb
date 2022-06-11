class RemoveArtistsFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :cover_artist, :string
    remove_column :books, :cover_artist_url, :string
    remove_column :books, :interior, :string
    remove_column :books, :interior_url, :string
  end
end
