# frozen_string_literal: true

FactoryBot.define do
  factory :wand_master do
    wand { Wand.find_by_name('Wand') || create(:wand) }
    character { Character.find_by_name('Harry James Potter') || create(:harry) }
  end
end
