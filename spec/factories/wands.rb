# frozen_string_literal: true

FactoryBot.define do
  factory :wand do
    name { "Wand"}
    path { '/wand'}
    manufacturer { 'MyString' }
    made { 'MyString' }
    wood { 'MyString' }
    core { 'MyString' }
    length { 'MyString' }
    characteristics { 'MyString' }
  end
end
