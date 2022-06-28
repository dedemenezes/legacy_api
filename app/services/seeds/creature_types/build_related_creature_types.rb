# frozen_string_literal: true

module Seeds
  module CreatureTypes
    class BuildRelatedCreatureTypes
      def initialize(infos_hash)
        @infos_hash = infos_hash
      end

      def script
        assign_related_types
      end

      def assign_related_types
        return unless @infos_hash['related']

        @infos_hash['related'].each { |type| assign_related_type(type) }
      end

      def assign_related_type(type)
        return nil if type[:path].match?(/http/)

        creature_type = CreatureType.find_by_path(@infos_hash['path'].first[:path])
        related_type = CreatureType.find_by_path(type[:path])
        related_type ||= CreatureTypes::BuildCreatureType.new(path: type[:path]).from_path
        RelatedCreatureType.create!(
          main: creature_type,
          related: related_type
        )
      end
    end
  end
end
