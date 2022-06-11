module UpdateBooks
  AssignArtists = proc do |infos, type, book|
      @book = book
    @type_key = type.to_s.gsub('_', ' ')
      assign_artists(infos, type) if infos[@type_key].present?
    end

  # def self.call(infos)
  #   assign_artists(infos, :cover_artist)
  #   assign_artists(infos, :interior) if infos['interior'].present?
  #   assign_artists(infos, :narrator) if infos['narrator'].present?
  #   assign_artists(infos, :author) if infos['author'].present?
  # end

  def self.assign_artists(hash, type)
    hash[@type_key].each do |artist|
      assign_artist(artist, type)
    end
  end

  def self.assign_artist(artist, type)
    artist = Artist.find_by_name_or_path(artist) || Artist.create!(name: artist[:title], path: artist[:path])
    BookArtist.create artist: artist, book: @book, role: type
  end
end
