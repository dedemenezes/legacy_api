class RemoveNarratorUrlFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :narrator_url, :string
  end
end
