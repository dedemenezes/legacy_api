# frozen_string_literal: true

class AddMembersCountToHouses < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :members_count, :integer
  end
end
