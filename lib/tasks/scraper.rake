# frozen_string_literal: true

namespace :scraper do
  desc 'Clean database before seed [DROP CREATE MIGRATE]'
  task clean_db: :environment do
    puts 'Cleaning Database'
    Book.destroy_all
    Wiki.destroy_all
    Character.destroy_all
    Wand.destroy_all
    puts 'DB Clean'
  end

  desc 'Seed books'
  task books: :environment do
    puts 'seeding books'
    path = '/wiki/Harry_Potter_(book_series)'
    doc_builder = DocBuilder.new path: path
    list_scraper = ListScraper.new(doc: doc_builder.html_doc)
    books_hashes = list_scraper.ordered_list_i_link
    books_hashes.each do |hash|
      next unless AlreadyExist.instance?(Book, hash[:path])

      puts "Building book #{hash[:title]}"
      book = Book.new_book(hash)
      puts "#{book.title} ready!"
    end
  end

  desc 'Seed basic characters: names and urls'
  task wikis: :environment do
    Book.all.each do |book|
      puts "Scraping chars urls from #{book.title}"
      doc_builder = DocBuilder.new(path: book.character_index_url)

      chars = if doc_builder.doc_has_table?
                TableScraper.new(doc: doc_builder.html_doc).all_urls_and_names
              else
                ListScraper.new(doc: doc_builder.html_doc).unordered_list_from_parent_node
              end
      amount = chars.reject(&:nil?).map do |char|
        next unless AlreadyExist.instance?(Wiki, char[:path])

        Wiki.create char
      end.compact.count
      puts "created #{amount} wikis for #{book.title}"
    end
  end

  desc 'Seed base type to all wikis'
  task base_types: :environment do
    puts 'Assigning base types'
    Wiki.where.not(path: nil).each do |wiki|
      next unless wiki.base_type.nil?

      doc            = DocBuilder.new(path: wiki.path).html_doc
      base_type      = InformationsScraper.new(doc: doc).scrape_information_type
      wiki.base_type = base_type
      wiki.save!

      puts wiki.title
    end
    puts 'Done'
  end

  desc 'Seed Characters by Biographical wikis'
  task characters: :environment do
    Wiki.where(base_type: 'Biographical information').each do |wiki|
      puts "Building character #{wiki.title}"
      next unless AlreadyExist.instance?(Character, wiki.path)

      doc                   = DocBuilder.new(path: wiki.path).html_doc
      infos                 = InformationsScraper.new(doc: doc).scrape_information_box

      attributes            = Character.generate_attribute_hash(infos)
      attributes[:path]     = wiki.path
      char                  = Character.create!(attributes)

      puts char.inspect
      puts '*' * 24
      puts '*' * 24
    end
  end

  desc 'Seed Wands'
  task wands: :environment do
    wands = Character.pluck(:wand, :wand_url).uniq.reject { |wand| wand.include? nil }
    wands.each do |name, url|
      puts "seeding #{name}"
      # next unless AlreadyExist.instance?(Wand, url)

      doc = DocBuilder.new(path: url).html_doc
      infos = InformationsScraper.new(doc: doc).scrape_information_box
      attributes = Wand.generate_attribute_hash(infos)
      attributes[:path] = url
      wand = Wand.create!(attributes)
      puts "#{wand.name} created"

      puts 'assigning master'
      wand_master = WandMaster.new
      wand_master.assign_master(infos)
      wand_master.assign_wand(wand) if wand_master.changed?
      wand_master.save
      puts "Master: #{wand_master.character.name}" if wand_master.persisted?

      masters_names = infos['masters']&.map { _1[:title] }

      if infos['owners']
        puts 'Assigning owners'
        owners = infos['owners']
        owners = owners.reject { |h| masters_names.include? h[:title] } if infos['masters']
        owners.each do |owner|
          owner = Character.find_by(path: owner[:path])
          WandOwner.create! wand: wand, character: owner if owner
        end
        puts "#{owners.count} owners assigned"
      end
      puts "#{wand.path} seeded"
    end
  end

  desc 'Scraper default'
  task seed: :environment do
    Rake::Task['scraper:clean_db'].execute
    Rake::Task['scraper:books'].execute
    Rake::Task['scraper:wikis'].execute
    Rake::Task['scraper:base_types'].execute
    Rake::Task['scraper:characters'].execute
    Rake::Task['scraper:wands'].execute
  end
end
