# frozen_string_literal: true

module Seeds
  module Wands
    def self.run
      puts 'Seeding wands...'
      # wands = Character.pluck(:wand_url).uniq.compact
      wands = RetrieveUrls.script(:character, :wand_url)
      wands.each do |url|
        puts "seeding #{url}"
        next if AlreadyExist.instance?(Wand, url) || url.include?('#')

        doc               = Scraper::DocBuilder.new(path: url).html_doc
        infos             = Parser::BoxInformation.new(doc: doc).scrape_information_box
        wand = Wand.new(path: url)
        UpdateModel::MissingFields::FromHash.script.call(wand, infos)
        wand.save!

        puts "#{wand.name} created"

        Masters.run(infos, wand)
        Owners.run(infos, wand)

        puts "#{wand.name} seeded with information from #{wand.path}"
      end
      puts "Done zo/\n"
    end
  end
end
