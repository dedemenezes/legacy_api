# frozen_string_literal: true

FactoryBot.define do
  factory :book_one, class: 'Book' do
    title { "Harry Potter and the Philosopher's Stone" }
    path { '/wiki/Harry_Potter_and_the_Philosopher%27s_Stone' }
    created_at { 'Fri, 27 May 2022 18:59:56.448787000 UTC +00:00' }
    updated_at { 'Fri, 27 May 2022 18:59:56.554274000 UTC +00:00' }
    name { "Harry Potter and the Philosopher's Stone" }
    image { "Harry Potter and the Philosopher's Stone – Bloomsbury 2014 Children's Edition " }
    image_url { 'https://static.wikia.nocookie.net/harrypotter/images/7/7a/Harry_Potter_and_the_Philosopher%27s_Stone_%E2%80%93_Bloomsbury_2014_Children%27s_Edition_%28Paperback_and_Hardcover%29.jpg/revision/latest?cb=20170109041611' }
    publisher { 'Bloomsbury ' }
    publisher_url { '/wiki/Bloomsbury_Publishing' }
    release_date { 'Thu, 26 Jun 1997 00:00:00.000000000 UTC +00:00' }
    release_date_url { '/wiki/26_June' }
    pages { 223 }
    followed_by { 'Harry Potter and the Chamber of Secrets' }
    followed_by_url { '/wiki/Harry_Potter_and_the_Chamber_of_Secrets' }
    preceded_by { nil }
    preceded_by_url { nil }
    character_index_url { '/wiki/Harry_Potter_and_the_Philosopher%27s_Stone_(character_index)' }
  end
end
