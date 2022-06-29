class RemoveRelatedAsMainCountFromRelatedCreatureTypes < ActiveRecord::Migration[6.1]
  def change
    remove_column :creature_types, :related_as_mains_count
  end
end
