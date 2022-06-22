# frozen_string_literal: true

module Seeds
  module Houses
    include FindBy

    def self.run
      # Gather houses url
      puts 'Seeding houses...'
      houses_paths = Character.houses_urls
      houses_paths.each do |url|
        house_doc = Scraper::DocBuilder.new(path: url).html_doc
        parser    = Parser::BoxInformation.new(doc: house_doc)
        infos     = parser.scrape_information_box
        house     = FindBy.name_or_path(House, { path: url })
        unless house
          house = House.new path: url
          UpdateModel::MissingFields::FromHash.script.call(house, infos)
          house.save!
        end
        puts "#{house.name} created!"

        puts 'Assigning members...'
        members = Seeds::Members.run(infos['members'], house) if infos['Members'.downcase].present?
        puts "#{house.name} has #{members.compact.size} members"

        puts 'Assigning heads...'
        headers = Seeds::Heads.run(infos['head'], house) if infos['Head'.downcase].present?
        puts "#{house.name} had #{headers[...-1].map(&:header).map(&:name).join(', ')} and #{headers[-1].header.name} as house head so far."

        puts 'Assigning traits...'
        Seeds::Traits.run(infos['traits'], house) if infos['Traits'.downcase].present?
        puts "#{house.name} traits are: #{house.distinctions[...-1].map(&:content).join(', ')} and #{house.distinctions[-1].content}"
      end
    end
  end
end
