# frozen_string_literal: true

class AddWizardColumnsToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :title, :string
    add_column :characters, :title_url, :string
    add_column :characters, :signature, :string
    add_column :characters, :signature_url, :string
    add_column :characters, :romances, :string
    add_column :characters, :romances_url, :string
    add_column :characters, :boggart, :string
    add_column :characters, :boggart_url, :string
    add_column :characters, :wand, :string
    add_column :characters, :wand_url, :string
    add_column :characters, :patronus, :string
    add_column :characters, :patronus_url, :string
    add_column :characters, :job, :string
    add_column :characters, :job_url, :string
    add_column :characters, :house, :string
    add_column :characters, :house_url, :string
  end
end
