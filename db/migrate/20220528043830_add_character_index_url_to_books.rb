# frozen_string_literal: true

class AddCharacterIndexUrlToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :character_index_url, :string
  end
end
