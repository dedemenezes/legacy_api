# frozen_string_literal: true

module Seeds
  module CharacterTypes
    def self.run
      CharacterType.destroy_all
      puts "Started"
      Character.all.each do |char|
        puts "#{char.name} is..."
        doc = DocBuilder.new(path: char.path).html_doc
        infos = InformationsScraper.new(doc: doc).scrape_information_box
        infos['species']&.each do |type|
          creature_type = CreatureType.find_by_name_or_path(type)
          next unless creature_type

          char_type = CharacterType.create(character: char, creature_type: creature_type)
          puts "a #{char_type.creature_type.name.upcase}" if char_type
        end
      end
    end
  end
end
