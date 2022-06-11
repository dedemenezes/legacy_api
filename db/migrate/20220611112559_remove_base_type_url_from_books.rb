class RemoveBaseTypeUrlFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :base_type_url, :string
  end
end
