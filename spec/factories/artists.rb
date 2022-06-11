FactoryBot.define do
  factory :jk, class: 'Artist' do
    name { "JK Rowling" }
    path { "/wiki/jk" }
  end

  factory :babi, class: 'Artist' do
    name { "Babi" }
    path { "/wiki/babi" }
  end

  factory :prada, class: 'Artist' do
    name { "prada" }
    path { "/wiki/prada" }
  end
end
