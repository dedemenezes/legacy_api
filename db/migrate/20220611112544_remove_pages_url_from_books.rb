# frozen_string_literal: true

class RemovePagesUrlFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :pages_url, :string
  end
end
