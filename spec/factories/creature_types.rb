# frozen_string_literal: true

FactoryBot.define do
  factory :human, class: 'CreatureType' do
    name { 'Human' }
    path { '/wiki/Human' }
    eyes { 'Varies' }
    hair { 'Varies' }
    native { 'Whole World' }
    height { 'Approx. 1.50 to 2.10 meters' }
    length { nil }
    mortality { 'Mortal' }
  end
end
