# frozen_string_literal: true

namespace :scraper do
  desc 'Clean database before seed [DROP CREATE MIGRATE]'
  task clean_db: :environment do
    puts 'Cleaning Database'
    Book.destroy_all
    Artist.destroy_all
    Wiki.destroy_all
    Character.destroy_all
    Wand.destroy_all
    CreatureType.destroy_all
    puts 'DB Clean'
  end

  desc 'Seed books'
  task books: :environment do
    Seeds::Books.run
  end

  desc 'Seed basic characters: names and urls'
  task wikis: :environment do
    Seeds::Wikis.run
  end

  desc 'Seed base type to all wikis'
  task base_types: :environment do
    Seeds::BaseTypes.run
  end

  desc 'Seed Characters by Biographical wikis'
  task characters: :environment do
    Seeds::Characters.run
  end

  desc 'Seed Wands'
  task wands: :environment do
    Seeds::Wands.run
  end

  desc 'Seed Creature Types'
  task creature_types: :environment do
    Seeds::Species.run
  end

  desc 'Seed Character Types'
  task character_types: :environment do
    Seeds::CharacterTypes.run
  end

  desc 'Scraper default'
  task clean_seed: :environment do
    Rake::Task['scraper:clean_db'].execute
    Rake::Task['scraper:books'].execute
    Rake::Task['scraper:wikis'].execute
    Rake::Task['scraper:base_types'].execute
    Rake::Task['scraper:characters'].execute
    Rake::Task['scraper:wands'].execute
    Rake::Task['scraper:creature_types'].execute
    Rake::Task['scraper:character_types'].execute
  end
end
