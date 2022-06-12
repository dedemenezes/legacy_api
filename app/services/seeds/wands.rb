module Seeds
  module Wands
    def self.run
      Wand.destroy_all
      wands = Character.pluck(:wand_url).uniq.compact
      wands.each do |url|
        puts "seeding #{url}"
        next unless AlreadyExist.instance?(Wand, url)

        doc               = Scraper::DocBuilder.new(path: url).html_doc
        infos             = InformationsScraper.new(doc: doc).scrape_information_box
        attributes        = Wand.generate_attribute_hash(infos)
        attributes[:path] = url
        wand              = Wand.create!(attributes)

        puts "#{wand.name} created"

        Masters.run(infos, wand)
        Owners.run(infos, wand)

        puts "#{wand.name} seeded with information from #{wand.path}"
      end
    end
  end
end
