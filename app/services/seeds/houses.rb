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
        binding.pry
        house     = FindBy.name_or_path(House, { path: url })
        unless house
          house = House.new path: url
          UpdateModel::MissingFields::FromHash.script.call(house, infos)
          house.save!
        end
        puts "#{house.name} created!"

        puts 'Assigning members...'
        members = infos['members'].map { |member| Seeds::Members.run(house, member) }
        puts "#{house.name} has #{members.compact.size} members"

        puts 'Assigning heads...'
        headers = infos['head'].map do |header|
          char = FindBy.name_or_path(Character, header)
          Head.create! header: char, house: house if char
        end
        puts "#{house.name} had #{headers[...-1].map(&:header).map(&:name).join(', ')} and #{headers[-1].header.name} as house head so far."

        # binding.pry
        puts 'Assigning distinctions...'
        distinctions = infos['traits'].map do |trait|
          Distinction.find_by_content(trait[:title]) || Distinction.create!(content: trait[:title], record: house)
        end
        puts "#{house.name} traits are: #{distinctions[...-1].map(&:content).join(', ')} and #{distinctions[-1].content}"
      end
    end
  end
  # class Houses
  #   attr_reader :infos, :paths

  #   def initialize
  #     @paths = Character.houses_urls
  #   end

  #   def run(filter = nil)
  #     @paths = paths.first(filter) if filter
  #     puts 'Seeding houses...'
  #     paths.each do |path|
  #       @house = House.find_by_path(path) || House.new(path: path)
  #       infos_hash(path)
  #       @house.image_url = infos['image'].first[:path]

  #       @house = UpdateModel::MissingFields::FromHash.script.call(@house, infos)
  #       characters_matching_house_url.each { |member| assign_member(@house, member) }
  #       @house.save!
  #       puts "#{@house.name} created!"
  #     end
  #   end

  #   def assign_member(house, member)
  #     puts "Assigning #{house.name} to #{member.name}.."
  #     Member.create! house: house, character: member
  #   end

  #   private

  #   def infos_hash(path)
  #     doc_builder = Scraper::Builder.using_net_and_uir(path)
  #     parser = Parser::BoxInformation.new(doc: doc_builder.html_doc)
  #     @infos = parser.scrape_information_box
  #   end

  #   def characters_matching_house_url
  #     Character.where(house_url: @house.path)
  #   end
  # end
end
