module Seeds
  module Books
    module GenerateBookAndRelatedInstances
      def self.script
        proc do |hash|
          doc_builder = DocBuilder.new path: hash[:path]
          infos = Scraper::InformationBoxAsHash.script.call(doc_builder.html_doc)

          @new_book = Book.find_by(name: hash[:title]) || Book.create(hash)
          UpdateBook::CharactersIndexUrl.script.call(@new_book, doc_builder.html_doc)

          BookArtist.roles.each_key do |type|
            UpdateBook::AssignArtists.script.call(infos, type, @new_book)
          end

          UpdateBook::MissingFields::Assign.script.call(infos, @new_book)

          @new_book
        end
      end
    end
  end
end
