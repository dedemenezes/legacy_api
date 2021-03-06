# frozen_string_literal: true

module UpdateModel
  module AssignArtists
    def self.script
      proc do |infos, type, book|
        @type_key = type.gsub('_', ' ')
        assign_artists(infos, type, book) if infos[@type_key].present?
      end
    end

    def self.assign_artists(hash, type, book)
      hash[@type_key].each do |artist|
        assign_artist(artist, type, book)
      end
    end

    def self.assign_artist(artist, type, book)
      artist = Artist.find_by_name_or_path(artist) || Artist.create!(name: artist[:title], path: artist[:path])
      BookArtist.create artist: artist, book: book, role: type.to_sym
    end
  end
end
# script.call(args)
