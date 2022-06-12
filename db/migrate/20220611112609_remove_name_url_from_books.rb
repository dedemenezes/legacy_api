# frozen_string_literal: true

class RemoveNameUrlFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :name_url, :string
  end
end
