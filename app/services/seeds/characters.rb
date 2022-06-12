# frozen_string_literal: true

module Seeds
  module Characters
    def self.run
      Wiki.where(base_type: 'Biographical information').each do |wiki|
        puts "Building character #{wiki.title}"
        next unless AlreadyExist.instance?(Character, wiki.path)

        doc                   = Scraper::DocBuilder.new(path: wiki.path).html_doc
        infos                 = Scraper::InformationsScraper.new(doc: doc).scrape_information_box

        attributes            = Character.generate_attribute_hash(infos)
        attributes[:path]     = wiki.path

        Character.create!(Character.right_attributes(attributes))
      end
      puts "Done zo/\n"
    end
  end
end
