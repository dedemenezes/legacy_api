module Seeds
  module Species
    module WikiSpecies
      def self.run
        Wiki.where(base_type: 'Species information').pluck(:path)
      end
    end
  end
end
