# frozen_string_literal: true

module Seeds
  module Characters
    def self.run
      Wiki.where(base_type: 'Biographical information').each do |wiki|
        puts "Building character #{wiki.title}"
        # next unless AlreadyExist.instance?(Character, wiki.path)

        character = build_from_path(title: wiki.title, path: wiki.path)
      end
      puts "Done zo/\n"
    end

    def self.build_from_path(title:, path:)
      doc       = Scraper::DocBuilder.new(path: path).html_doc
      infos     = Parser::BoxInformation.new(doc: doc).scrape_information_box
      character = Character.new(name: title, path: path)
      UpdateModel::MissingFields::FromHash.script.call(character, infos)
      character.save!
      character
    end
  end
end
