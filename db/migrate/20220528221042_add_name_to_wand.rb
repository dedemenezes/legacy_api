# frozen_string_literal: true

class AddNameToWand < ActiveRecord::Migration[6.1]
  def change
    add_column :wands, :name, :string
  end
end
