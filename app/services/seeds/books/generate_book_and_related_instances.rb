module Seeds
  module Books
    GenerateBookAndRelatedInstances = proc do |hash|
      doc_builder = DocBuilder.new path: hash[:path]
      infos = Scraper::InformationBoxAsHash.call(doc_builder.html_doc)

      @new_book = Book.find_by(name: hash[:title]) || Book.create(hash)
      UpdateBook::CharactersIndexUrl.call(@new_book, doc_builder.html_doc)

      BookArtist.roles.each_key do |type|
        UpdateBook::AssignArtists.call(infos, type, @new_book)
      end

      UpdateBook::MissingFields.call(infos, @new_book)

      @new_book
    end
  end
end
