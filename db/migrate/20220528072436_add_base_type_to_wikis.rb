class AddBaseTypeToWikis < ActiveRecord::Migration[6.1]
  def change
    add_column :wikis, :base_type, :string
  end
end
