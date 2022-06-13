# frozen_string_literal: true

module Seeds
  # scrape and populate db with creature types, distinctions and related types
  module Species
    def self.run
      puts 'Seeding creature types'

      chars = RetriveUrls.script(:character, :species_url)
      wikis = Wiki.paths_for('Species information')

      species_urls = wikis.push(chars).flatten.uniq
      species_urls.each do |url|
        next if url.include? 'http'

        @url = url
        next if CreatureType.find_by(path: @url)
        information_scraper, creature_type = building_creature_type
        next unless creature_type

        information_scraper.informations['distinction']&.each do |distinction|
          Distinction.create content: distinction[:title], creature_type: creature_type
        end

        puts creature_type.description if creature_type.distinctions.present?

        if (information_scraper.informations.keys.include? 'image') && information_scraper.informations['image'].first[:path].present?
          assign_creature_type_image(creature_type, information_scraper)
        end

        if information_scraper.informations.keys.include? 'related'
          assign_related_types(information_scraper.informations['related'], creature_type)
        end
      end
      puts "Done zo/\n"
    end

    def self.building_creature_type
      information_scraper = scrape_creature_type_informations
      creature_type = create_creature_type(information_scraper)
      [information_scraper, creature_type]
    end

    def self.scrape_creature_type_informations
      doc = Scraper::DocBuilder.new(path: @url).html_doc
      information_scraper = Scraper::InformationsScraper.new(doc: doc)
      information_scraper.scrape_information_box
      information_scraper
    end

    def self.create_creature_type(information_scraper)
      # p information_scraper.informations
      puts "Starting #{@url}..."
      titles_only = information_scraper.infos_titles_only
      creature_type_attributes = titles_only.select do |key, _v|
                                   attributes_keys.include? key
                                 end.map { [_1, _2.first.strip] }.to_h
      species = CreatureType.find_by(name: creature_type_attributes[:name])
      species ||= CreatureType.new(creature_type_attributes)
      species.path ||= @url
      species.save
      puts "Created #{species.name}"
      species
    end

    def self.assign_creature_type_image(creature_type, information_scraper)
      image_attributes = information_scraper.informations['image'].first
      puts "Assigning #{image_attributes[:path]} using Picture polymorphic model..."
      pic = Picture.new(image_attributes)
      pic.imageable = creature_type
      pic.save!
      # puts pic.path
    end

    def self.assign_related_types(types, creature_type)
      puts "Assigning related types #{types} to #{creature_type.name}..."
      types.each do |type|
        next if type[:path].include? 'http'

        related_type = CreatureType.find_by(path: type[:path])
        if related_type.nil?
          @url = type[:path]
          _information_scraper, related_type = building_creature_type
        end
        related_types = RelatedCreatureType.create main: creature_type, related: related_type
        p "#{related_types.main.name} assigned to #{related_types.related.name}"
      end
    end

    def self.attributes_keys
      CreatureType.new.attributes.keys
    end
  end
end
