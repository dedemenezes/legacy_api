module Seeds
  module Characters
    def self.run
      Wiki.where(base_type: 'Biographical information').each do |wiki|
        puts "Building character #{wiki.title}"
        next unless AlreadyExist.instance?(Character, wiki.path)

        doc                   = DocBuilder.new(path: wiki.path).html_doc
        infos                 = InformationsScraper.new(doc: doc).scrape_information_box

        attributes            = Character.generate_attribute_hash(infos)
        attributes[:path]     = wiki.path
        char                  = Character.create!(attributes)

        puts char.inspect
        puts '*' * 24
        puts '*' * 24
      end
    end
  end
end
