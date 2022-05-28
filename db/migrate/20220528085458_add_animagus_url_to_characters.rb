# frozen_string_literal: true

class AddAnimagusUrlToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :animagus_url, :string
  end
end
