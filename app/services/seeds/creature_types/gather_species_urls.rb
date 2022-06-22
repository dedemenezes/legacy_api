# frozen_string_literal: true

module Seeds
  module CreatureTypes
    class GatherSpeciesUrls
      attr_reader :urls

      def initialize
        @urls = wikis.push(chars).flatten.uniq.compact
      end

      def chars
        @chars = RetrieveUrls.script(:character, :species_url)
      end

      def wikis
        @wikis = Wiki.paths_for('Species information')
      end
    end
  end
end
