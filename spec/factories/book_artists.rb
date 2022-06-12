FactoryBot.define do
  factory :fryer_narrator, class: 'BookArtist' do
    book { Book.last || create(:book_one) }
    artist { Artist.last || create(:fryer) }
    role { :narrator }
  end
  
  factory :babi_cover, class: 'BookArtist' do
    book { Book.last || create(:book_one) }
    artist { Artist.last || create(:babi) }
    role { :cover_artist }
  end
  factory :prada_cover, class: 'BookArtist' do
    book { Book.last || create(:book_one) }
    artist { create(:prada) }
    role { :cover_artist }
  end

  factory :jk_author, class: 'BookArtist' do
    book { create(:book_one) }
    artist { create(:jk) }
    role { :author }
  end

  factory :babi_interior, class: 'BookArtist' do
    book { Book.last || create(:book_one) }
    artist { Artist.last || create(:babi) }
    role { :interior }
  end
  factory :prada_interior, class: 'BookArtist' do
    book { Book.last || create(:book_one) }
    artist { Artist.last || create(:prada) }
    role { :interior }
  end
end
