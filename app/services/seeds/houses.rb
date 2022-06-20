module Seeds
  module Houses
    def self.run
      # Gather houses url
      puts 'Seeding houses...'
      houses_paths = Character.houses_urls
      houses_paths.each do |url|
        # scrape each url
        house_doc = Scraper::DocBuilder.new(path: url).html_doc
        infos     = Parser::BoxInformation.new(doc: house_doc).scrape_information_box
        house = House.new path: url
        UpdateModel::MissingFields::FromHash.script.call(house, infos)
        binding.pry
        house.save!
        puts "#{house.name} created!"
      end
      # create each house
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
