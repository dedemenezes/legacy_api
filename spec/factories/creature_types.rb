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

  factory :wolf, class: 'CreatureType' do
    name { 'wolf' }
    path { '/wiki/wolf' }
  end

  factory :dog, class: 'CreatureType' do
    name { 'dog' }
    path { '/wiki/dog' }
  end

  factory :ghost, class: 'CreatureType' do
    name { 'ghost' }
    path { '/wiki/Ghost' }
  end

  factory :wizardkind, class: 'CreatureType' do
    name { 'wizardkind' }
    path { '/wiki/Wizardkind' }
  end
end
