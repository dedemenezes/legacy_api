# frozen_string_literal: true

class ChangeCreatureTypeReferencesInDistinctions < ActiveRecord::Migration[6.1]
  def change
    change_column_null :distinctions, :creature_type_id, from: false, to: true
  end
end
