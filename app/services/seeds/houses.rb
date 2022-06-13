module Seeds
  class Houses
    attr_reader :infos, :paths

    def initialize
      @paths = Character.pluck(:house_url).uniq
    end

    def run(filter = nil)
      @paths = paths.first(filter) if filter
      paths.each do |path|
        @house = House.new path: path
        infos_hash(path)
        UpdateBook::MissingFields::FromHash.script.call(@house, infos)
        characters_matching_house_url.each { |member| assign_member(@house, member) }
      end
    end

    def assign_member(house, member)
      Member.create! house: house, character: member
    end

    private

    def infos_hash(path)
      doc_builder = Scraper::Builder.using_net_and_uir(path)
      parser = Scraper::InformationsScraper.new(doc: doc_builder.html_doc)
      @infos = parser.scrape_information_box
    end

    def characters_matching_house_url
      Character.where(house_url: @house.path)
    end
  end
end
