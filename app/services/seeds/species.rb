module Seeds
  module Species
    def self.run
      CreatureType.destroy_all
      chars = CharacterSpecies.run
      wikis = WikiSpecies.run
      species_urls = wikis.push(chars).flatten.uniq
      (Seeds::Species::WikiSpecies.run.push Seeds::Species::CharacterSpecies.run).flatten.uniq
      species_urls.each do |url|
        next if url.include? "http"

        @url = url
        next if CreatureType.find_by(path: @url)

        puts "Starting #{@url}..."
        information_scraper, creature_type = building_creature_type
        next unless creature_type

        if (information_scraper.informations.keys.include? "image") && information_scraper.informations['image'].first[:path].present?
          assign_creature_type_image(creature_type, information_scraper)
        end

        if information_scraper.informations.keys.include? 'related'
          assign_related_types(information_scraper.informations['related'], creature_type)
        end
      end
      puts 'Done zo/'
    end

    def self.building_creature_type
      information_scraper = scrape_creature_type_informations
      creature_type = create_creature_type(information_scraper)
      [information_scraper, creature_type]
    end

    def self.scrape_creature_type_informations
      doc = DocBuilder.new(path: @url).html_doc
      information_scraper = InformationsScraper.new(doc: doc)
      information_scraper.scrape_information_box
      information_scraper
    end

    def self.create_creature_type(information_scraper)
      # p information_scraper.informations
      titles_only = information_scraper.infos_titles_only
      creature_type_attributes = titles_only.select { |key, _v| attributes_keys.include? key }.map { [_1, _2.first.strip] }.to_h
      species = CreatureType.find_by(name: creature_type_attributes[:name])
      species ||= CreatureType.new(creature_type_attributes)
      species.path ||= @url
      species.save
      species
    end

    def self.assign_creature_type_image(creature_type, information_scraper)
      image_attributes = information_scraper.informations['image'].first
      pic = Picture.new(image_attributes)
      pic.imageable = creature_type
      pic.save!
    end

    def self.assign_related_types(array, creature_type)
      array.each_with_index do |hash, index|
        # sleep 5 if ((index + 1) % 5).zero?

        puts "Starting related #{hash}..."
        related_types = RelatedCreatureType.new
        related_types.main = creature_type
        related_type = CreatureType.find_by(path: hash[:path])
        if related_type.nil?
          # puts 'scraping inside loop'
          # information_scraper_related = scrape_creature_type_informations(hash[:path])
          # puts 'creating new type'
          # related_type = create_creature_type(information_scraper_related, hash[:path])
          next if hash[:path].include? "http"

          @url = hash[:path]
          # sleep(1)
          information_scraper, related_type = building_creature_type
        end
        related_types.related = related_type
        next unless related_types.save

        puts '#' * 13
      end
    end

    def self.attributes_keys
      CreatureType.new.attributes.keys
    end
  end
end
