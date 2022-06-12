# frozen_string_literal: true

module Seeds
  module CharacterTypes
    def self.run
      puts 'Seeding characters types'

      Character.all.each do |char|
        doc = Scraper::DocBuilder.new(path: char.path).html_doc
        infos = Scraper::InformationsScraper.new(doc: doc).scrape_information_box
        infos['species']&.each do |type|
          creature_type = CreatureType.find_by_name_or_path(type)
          next unless creature_type

          CharacterType.create(character: char, creature_type: creature_type)
          # puts "#{char.name} is...a #{char_type.creature_type.name.upcase}" if char_type
        end
        puts "Done zo/\n"
      end
    end
  end
end
