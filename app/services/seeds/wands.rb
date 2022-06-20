# frozen_string_literal: true

module Seeds
  module Wands
    def self.run
      puts 'Seeding wands...'
      # wands = Character.pluck(:wand_url).uniq.compact
      wands = RetrieveUrls.script(:character, :wand_url)
      wands.each do |url|
        puts "seeding #{url}"
        next unless AlreadyExist.instance?(Wand, url)

        doc               = Scraper::DocBuilder.new(path: url).html_doc
        infos             = Parser::BoxInformation.new(doc: doc).scrape_information_box
        wand = Wand.new(path: url)
        UpdateModel::MissingFields::FromHash.script.call(wand, infos)
        wand.save!

        puts "#{wand.name} created"

        Masters.run(infos, wand)
        Owners.run(infos, wand)
        binding.pry

        puts "#{wand.name} seeded with information from #{wand.path}"
      end
      puts "Done zo/\n"
    end
  end
end
