module Seeds
  module Books
    GenerateBookAndRelatedInstances = proc do |hash|
      binding.pry
      doc_builder = DocBuilder.new path: hash[:path]
      infos = Scraper::InformationBoxAsHash.call(doc_builder.html_doc)
      @new_book = Book.find_by(name: hash[:title]) || Book.create(hash)
      UpdateBook::CharactersIndexUrl.call(@new_book, doc_builder.html_doc)
      %i[cover_artist interior narrator author].each do |type|
        UpdateBook::AssignArtists.call(infos, type, @new_book)
      end

      UpdateBook::MissingFields.call(infos, @new_book)
      @new_book
    end
  end
end
