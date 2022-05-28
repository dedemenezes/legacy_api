# frozen_string_literal: true

class AddColumnsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :name, :string
    add_column :books, :name_url, :string
    add_column :books, :image, :string
    add_column :books, :image_url, :string
    add_column :books, :cover_artist, :string
    add_column :books, :cover_artist_url, :string
    add_column :books, :interior, :string
    add_column :books, :interior_url, :string
    add_column :books, :narrator, :string
    add_column :books, :narrator_url, :string
    add_column :books, :publisher, :string
    add_column :books, :publisher_url, :string
    add_column :books, :release_date, :datetime
    add_column :books, :release_date_url, :string
    add_column :books, :pages, :integer
    add_column :books, :pages_url, :string
    add_column :books, :followed_by, :string
    add_column :books, :followed_by_url, :string
    add_column :books, :preceded_by, :string
    add_column :books, :preceded_by_url, :string
  end
end
