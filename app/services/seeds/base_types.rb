# frozen_string_literal: true

module Seeds
  module BaseTypes
    def self.run
      puts 'Assigning base types'
      Wiki.where.not(path: nil).each do |wiki|
        next unless wiki.base_type.nil?

        doc            = Scraper::DocBuilder.new(path: wiki.path).html_doc
        base_type      = Parser::BoxInformation.new(doc: doc).scrape_information_type
        wiki.base_type = base_type
        wiki.save!
        puts "#{wiki.title} is a #{wiki.base_type}"
      end
      puts "Done zo/\n"
    end
  end
end
