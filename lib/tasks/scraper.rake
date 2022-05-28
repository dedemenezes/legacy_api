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
      books_hashes.each do |hash|
        puts "Building book #{hash[:title]}"
        book = Book.new_book(hash)
        puts "#{book.title} ready!"
      end
    else
      puts "Sorry, I can't do this!\nYou should clean your DB first\nzo/"
    end
  end

  desc "Seed Characters Names and Urls"
  task wikis: :environment do
    return sh "Sorry, I can't do this!\nYou should clean your DB first\nzo/" if Wiki.count.positive?
    # iterate over books
    Book.all.each do |book|
      puts "Scraping chars urls from #{book.title}"
      # parse chars_index_url
      doc_builder = DocBuilder.new(path: book.character_index_url)
      # Check if organized as list or table
      # scrape using correct methods
      chars = if doc_builder.doc_has_table?
                TableScraper.new(doc: doc_builder.html_doc).all_urls_and_names
              else
                ListScraper.new(doc: doc_builder.html_doc).unordered_list_from_parent_node
              end
      amount = chars.map { |char| Wiki.create char }.compact.count
      puts "created #{amount} wikis for #{book.title}"
    end
  end

  desc 'Scraper default'
  task default: :environment do
    Rake::Task['scraper:clean_db'].execute
    Rake::Task['scraper:books'].execute
    Rake::Task['scraper:wikis'].execute
  end
end
