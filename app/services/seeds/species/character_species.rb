module Seeds
  module Species
    module CharacterSpecies
      def self.run
        Character.pluck(:species_url).uniq.compact
      end
    end
  end
end
