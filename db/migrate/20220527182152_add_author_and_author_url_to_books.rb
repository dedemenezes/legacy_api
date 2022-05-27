class AddAuthorAndAuthorUrlToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :author, :string
    add_column :books, :author_url, :string
  end
end
