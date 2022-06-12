# frozen_string_literal: true

FactoryBot.define do
  factory :character_type do
    character { Character.first || create(:harry) }
    creature_type { CreatureType.first || create(:human) }
  end
end
