module Seeds
  module Species
    def self.run
      species = (WikiSpecies.run.push CharacterSpecies.run).flatten.uniq
      species.each do |url|
        doc = DocBuilder.new(path: url).html_doc
        infos = InformationsScraper.new(doc: doc).scrape_information_box
        binding.pry
        p infos
      end
    end

  end
end
