# frozen_string_literal: true

FactoryBot.define do
  factory :harry_gryffindor, class: 'Member' do
    association :house, factory: :gryffindor
    association :character, factory: :harry
  end
end
