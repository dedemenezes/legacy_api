namespace :scraper do

  desc "Clean database before seed [DROP CREATE MIGRATE]"
  task clean_db: :environment do
    puts 'dropping db'
    sh 'rails db:drop db:create db:migrate'
  end

  desc "Seed books"
  task books: :environment do
    if Book.count == 0
      puts 'seeding books'
      path = '/wiki/Harry_Potter_(book_series)'
      doc_builder = DocBuilder.new path: path
      list_scraper = ListScraper.new(doc: doc_builder.html_doc)
      books_hashes = list_scraper.ordered_list_i_link
      infos = []
      books = books_hashes.map do |hash|
        puts "Building book #{hash[:title]}"
        book = Book.new(hash)
        doc_builder.path = hash[:path]
        doc_builder.build_nokogiri_doc_from_url
        infos = InformationsScraper.new(doc: doc_builder.html_doc).scrape_information_box
        infos.each do |key, values|
          book.add_new_information(key, values)
        end
        puts "#{book.title} ready!"
      end
    else
      puts "Sorry, I can't do this!\nYou should clean your DB first\nzo/"
    end
  end

  desc 'Scraper default'
  task default: :environment do
    Rake::Task['scraper:clean_db'].execute
    Rake::Task['scraper:books'].execute
  end
end
