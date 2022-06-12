# frozen_string_literal: true

module Seeds
  module Species
    # retrive path from wiki if it's a species information type
    module WikiSpecies
      def self.run
        Wiki.where(base_type: 'Species information').pluck(:path)
      end
    end
  end
end
