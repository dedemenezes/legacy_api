# frozen_string_literal: true

FactoryBot.define do
  factory :wand do
    name { 'Wand' }
    path { '/wand' }
    manufacturer { 'MyString' }
    made { 'MyString' }
    wood { 'MyString' }
    core { 'MyString' }
    length { 'MyString' }
    characteristics { 'MyString' }
  end

  factory :wand_two, class: 'Wand' do
    name { 'Wand_2' }
    path { '/wand_2' }
    manufacturer { 'MyString' }
    made { 'MyString' }
    wood { 'MyString' }
    core { 'MyString' }
    length { 'MyString' }
    characteristics { 'MyString' }
  end
end
