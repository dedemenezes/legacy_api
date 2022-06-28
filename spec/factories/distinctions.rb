# frozen_string_literal: true

FactoryBot.define do
  factory :distinction do
    content { 'Not nice to enviroment' }
    record { CreatureType.find_by_name('Human') || create(:human) }
  end
  factory :distinction_two, class: 'Distinction' do
    content { 'living on Earth' }
    record { CreatureType.find_by_name('Human') || create(:human) }
  end

  factory :house_trait, class: 'Distinction' do
    sequence(:content) { |n| "Trait #{n}" }
    record { House.find_by_name("Gryffindor") || create(:gryffindor) }
  end
end
