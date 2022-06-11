class RemoveAuthorUrlFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :author_url, :string
  end
end
