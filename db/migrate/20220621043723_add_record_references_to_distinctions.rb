# frozen_string_literal: true

class AddRecordReferencesToDistinctions < ActiveRecord::Migration[6.1]
  def change
    add_reference :distinctions, :record, polymorphic: true
  end
end
