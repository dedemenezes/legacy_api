module Seeds
  module CreatureTypes
    module BuildRelatedCreatureType
      def self.script(infos_hash, type)
        return nil if type[:path].match? /http/

        creature_type = CreatureType.find_by_path(infos_hash['path'].first[:path])
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
