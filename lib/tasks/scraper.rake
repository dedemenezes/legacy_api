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

  desc "Seed base type to all wikis"
  task base_types: :environment do
    puts "Assigning base types"
    Wiki.where.not(path: nil).each do |wiki|
      next unless wiki.base_type.nil?
      doc = DocBuilder.new(path: wiki.path).html_doc
      base_type = InformationsScraper.new(doc: doc).scrape_information_type
      wiki.base_type = base_type
      wiki.save!
      puts wiki.title
    end
  end

  desc 'Seed Biographical informations'
  task bio_info: :environment do
    # Character.destroy_all
    Wiki.where(base_type: "Biographical information").each do |wiki|
      # next if Character.find_by(name: wiki.title)
      binding.pry

      doc = DocBuilder.new(path: wiki.path).html_doc
      infos = InformationsScraper.new(doc: doc).scrape_information_box
      attributes = Character.generate_attribute_hash(infos)
      puts "*" * 24
      # binding.pry
      p attributes
      puts "*" * 24
      # sleep(1)
      char = Character.create!(attributes)
      puts char.inspect
      puts "*" * 24
      puts "*" * 24
      # infos.map do |key, values|
      #   attributes[key.to_sym] = values.first[:title]
      # end
      # infos
    end
  end




  desc 'Scraper default'
  task seed: :environment do
    Rake::Task['scraper:clean_db'].execute
    Rake::Task['scraper:books'].execute
    Rake::Task['scraper:wikis'].execute
    Rake::Task['scraper:base_types'].execute
    Rake::Task['scraper:bio_info'].execute
  end
end
