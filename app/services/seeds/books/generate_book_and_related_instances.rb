# frozen_string_literal: true

module Seeds
  module Books
    module GenerateBookAndRelatedInstances
      def self.script
        proc do |hash|
          doc_builder = Scraper::DocBuilder.new path: hash[:path]
          infos = Scraper::InformationBoxAsHash.script.call(doc_builder.html_doc)

          @new_book = Book.find_by(name: hash[:title]) || Book.create(hash)
          UpdateModel::CharactersIndexUrl.script.call(@new_book, doc_builder.html_doc)

          BookArtist.roles.each_key do |type|
            UpdateModel::AssignArtists.script.call(infos, type, @new_book)
          end

          UpdateModel::MissingFields::FromHash.script.call(@new_book, infos)
          @new_book
        end
      end
    end
  end
end
