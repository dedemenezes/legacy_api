# frozen_string_literal: true

module Seeds
  module Species
    # retrive species_url from all characters
    module CharacterSpecies
      def self.run
        Character.pluck(:species_url).uniq.compact
      end
    end
  end
end
