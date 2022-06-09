# frozen_string_literal: true

FactoryBot.define do
  factory :wand_master do
    wand { Wand.first || create(:wand) }
    character { Character.first || create(:harry) }
  end
end
