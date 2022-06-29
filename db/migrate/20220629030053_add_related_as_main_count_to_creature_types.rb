class AddRelatedAsMainCountToCreatureTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :creature_types, :related_as_mains_count, :integer
  end
end
