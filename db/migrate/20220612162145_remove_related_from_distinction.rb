# frozen_string_literal: true

class RemoveRelatedFromDistinction < ActiveRecord::Migration[6.1]
  def change
    remove_reference :distinctions, :related, index: true, foreign_key: { to_table: :creature_types }
  end
end
