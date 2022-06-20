# frozen_string_literal: true

module Seeds
  module Characters
    def self.run
      Wiki.where(base_type: 'Biographical information').each do |wiki|
        puts "Building character #{wiki.title}"
        # next unless AlreadyExist.instance?(Character, wiki.path)

        doc                   = Scraper::DocBuilder.new(path: wiki.path).html_doc
        infos                 = Parser::BoxInformation.new(doc: doc).scrape_information_box
        character = Character.new(name: wiki.title, path: wiki.path)
        UpdateModel::MissingFields::FromHash.script.call(character, infos)
        character.save!
        binding.pry
      end
      puts "Done zo/\n"
    end
  end
end
