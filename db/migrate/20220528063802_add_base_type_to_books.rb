# frozen_string_literal: true

class AddBaseTypeToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :base_type, :string
    add_column :books, :base_type_url, :string
  end
end
