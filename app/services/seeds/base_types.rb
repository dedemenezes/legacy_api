module Seeds
  module BaseTypes
    def self.run
      puts 'Assigning base types'
      Wiki.where.not(path: nil).each do |wiki|
        next unless wiki.base_type.nil?

        doc            = Scraper::DocBuilder.new(path: wiki.path).html_doc
        base_type      = Scraper::InformationsScraper.new(doc: doc).scrape_information_type
        wiki.base_type = base_type
        wiki.save!

        puts wiki.title
      end
      puts 'Done'
    end
  end
end
