# frozen_string_literal: true

class RemoveNarratorFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :narrator, :string
  end
end
