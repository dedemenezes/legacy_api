# frozen_string_literal: true

module Seeds
  module Wands
    def self.run
      puts 'Seeding wands...'
      wands = Character.pluck(:wand_url).uniq.compact
      wands = RetriveUrls.script(:character, :wand_url)
      wands.each do |url|
        # puts "seeding #{url}"
        next unless AlreadyExist.instance?(Wand, url)

        doc               = Scraper::DocBuilder.new(path: url).html_doc
        infos             = Scraper::InformationsScraper.new(doc: doc).scrape_information_box
        attributes        = Wand.generate_attribute_hash(infos)
        attributes[:path] = url
        wand              = Wand.create!(attributes)

        # puts "#{wand.name} created"

        Masters.run(infos, wand)
        Owners.run(infos, wand)

        # puts "#{wand.name} seeded with information from #{wand.path}"
      end
      puts "Done zo/\n"
    end
  end
end
