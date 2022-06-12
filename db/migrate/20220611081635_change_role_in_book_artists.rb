# frozen_string_literal: true

class ChangeRoleInBookArtists < ActiveRecord::Migration[6.1]
  def change
    change_column :book_artists, :role, :integer
  end
end
