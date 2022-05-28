# frozen_string_literal: true

class AddColumnsToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :image_url, :string
    add_column :characters, :name_url, :string
    add_column :characters, :born_url, :string
    add_column :characters, :blood_url, :string
    add_column :characters, :marital_url, :string
    add_column :characters, :nationality_url, :string
    add_column :characters, :nickname_url, :string
    add_column :characters, :specsie_url, :string
    add_column :characters, :gender_url, :string
    add_column :characters, :weight_urlhair_url, :string
    add_column :characters, :eyes_url, :string
    add_column :characters, :skin_url, :string
    add_column :characters, :family_url, :string
    add_column :characters, :loyalty_url, :string
    add_column :characters, :base_type_url, :string
  end
end
