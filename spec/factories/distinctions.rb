# frozen_string_literal: true

FactoryBot.define do
  factory :distinction do
    content { 'Not nice to enviroment' }
    creature_type { CreatureType.find_by_name('Human') || create(:human) }
  end
  factory :distinction_two, class: 'Distinction' do
    content { 'living on Earth' }
    creature_type { CreatureType.find_by_name('Human') || create(:human) }
  end
end
