# frozen_string_literal: true

FactoryBot.define do
  factory :harry, class: 'Character' do
    image { 'Harry Potter.jpg' }
    name { 'Harry James Potter' }
    born { '31 July 1980' }
    blood { 'Half-blood' }
    marital { 'Married' }
    nationality { 'English' }
    nickname { 'The Boy Who Lived' }
    species { 'Human' }
    gender { 'Male' }
    weight { nil }
    hair { 'Jet-black' }
    eyes { 'Bright green' }
    skin { 'Light' }
    family { 'James Potter I' }
    loyalty { 'Potter family' }
    base_type { 'Biographical information' }
    created_at { 'Mon, 30 May 2022 06:16:52.524177000 UTC +00:00' }
    updated_at { 'Mon, 30 May 2022 06:16:52.524177000 UTC +00:00' }
    image_url { 'https://static.wikia.nocookie.net/harrypotter/images/9/97/Harry_Potter.jpg/revision/latest?cb=20140603201724' }
    born_url { '/wiki/31_July' }
    blood_url { '/wiki/Half-blood' }
    marital_url { nil }
    nationality_url { '/wiki/England' }
    nickname_url { nil }
    species_url { '/wiki/Human' }
    gender_url { nil }
    weight_urlhair_url { nil }
    eyes_url { nil }
    skin_url { nil }
    family_url { '/wiki/James_Potter_I' }
    loyalty_url { '/wiki/Potter_family' }
    base_type_url { nil }
    died { nil }
    died_url { nil }
    title { 'Triwizard Champion' }
    title_url { '/wiki/Triwizard_Tournament' }
    signature { 'Signature' }
    signature_url { 'https://static.wikia.nocookie.net/harrypotter/images/f/f0/Harry_Potter_sig.png/revision/latest?cb=20150826224906' }
    romances { 'Cho Chang ' }
    romances_url { '/wiki/Cho_Chang' }
    boggart { 'Dementor' }
    boggart_url { '/wiki/Dementor' }
    # wand { Wand.first || create(:wand) }
    wand_url { '/wiki/Harry_Potter%27s_wand' }
    patronus { 'Stag' }
    patronus_url { '/wiki/Deer' }
    job { 'Head of British Auror Office' }
    job_url { '/wiki/British_Auror_Office' }
    house_url { '/wiki/Gryffindor' }
    height { nil }
    animagus { nil }
    animagus_url { nil }
    feathers { nil }
    feathers_url { nil }
    hair_url { nil }
    height_url { nil }
    path { '/wiki/Harry_Potter' }
  end

  factory :dede, class: 'Character' do
    name { 'dede' }
    path { '/dede' }
    species_url { '/wiki/human' }
    house { 'Hufflepuff' }
    house_url { '/wiki/Hufflepuff' }
  end

  factory :bamba, class: 'Character' do
    name { 'bamba' }
    path { '/bamba' }
    house { 'Ravenclaw' }
    house_url { '/wiki/Ravenclaw' }
  end

  factory :babi_char, class: 'Character' do
    name { 'babi_char' }
    path { '/babi_char' }
    house { 'Slytherin' }
    house_url { '/wiki/Slytherin' }
  end

  factory :muggle, class: 'Character' do
    name { 'muggle' }
    path { '/muggle' }
    house { nil }
    house_url { nil }
  end

  factory :character do
    path { '/character' }
    house { nil }
    house_url { nil }
  end
end
