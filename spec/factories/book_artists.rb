FactoryBot.define do
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
end
