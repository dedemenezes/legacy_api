# frozen_string_literal: true

module Seeds
  # scrape and populate db with creature types, distinctions and related types
  module Species
    def self.run(filter = nil)
      urls = CreatureTypes::GatherSpeciesUrls.new.urls
      urls = urls.first(filter) if filter.present?

      infos_hashs = urls.map do |path|
        type_builder = CreatureTypes::BuildCreatureType.new(path: path)
        type_builder.from_path
        type_builder.infos_hash
      end

      infos_hashs.compact.each { |infos_hash| CreatureTypes::BuildRelatedCreatureTypes.new(infos_hash).script }
      puts 'Done !!!'
    end
  end
end

