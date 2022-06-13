FactoryBot.define do
  factory :gryffindor, class: 'House' do
    name { 'Gryffindor' }
    path { '/wiki/Gryffindor' }
    founder { 'MyString' }
    founder_url { 'MyString' }
    animal { 'MyString' }
    animal_url { 'MyString' }
    element { 'MyString' }
    element_url { 'MyString' }
    ghost { 'MyString' }
    ghost_url { 'MyString' }
    common_room { 'MyString' }
    common_room_url { 'MyString' }
  end
end
