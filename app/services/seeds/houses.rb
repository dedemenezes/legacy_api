# frozen_string_literal: true

module Seeds
  module Houses
    def self.run
      # Gather houses url
      puts 'Seeding houses...'
      houses_paths = Character.houses_urls
      houses_paths.each do |url|
        house_doc = Scraper::DocBuilder.new(path: url).html_doc
        parser    = Parser::BoxInformation.new(doc: house_doc)
        builder   = BuildHouse.new(parser: parser, url: url)
        builder.now
        builder.assing_members
        builder.assign_heads
        builder.assign_traits
        builder.done
        # Seeds::Houses::Traits.run(builder.infos['traits'], builder.house) if builder.infos['Traits'.downcase].present?
      end
    end
  end
end
