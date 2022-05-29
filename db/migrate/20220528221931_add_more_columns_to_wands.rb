# frozen_string_literal: true

class AddMoreColumnsToWands < ActiveRecord::Migration[6.1]
  def change
    add_column :wands, :masters, :string
    add_column :wands, :masters_url, :string
    add_column :wands, :manufacturer_url, :string
  end
end
