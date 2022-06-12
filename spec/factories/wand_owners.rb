# frozen_string_literal: true

FactoryBot.define do
  factory :wand_owner do
    wand { Wand.find_by_name('Wand_2') || create(:wand_two) }
    character { Character.find_by_name('Harry James Potter') || create(:harry) }
  end
end
