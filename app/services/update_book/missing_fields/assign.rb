module UpdateBooks
  module MissingFields
    Assign = proc do |book, attribute, value|
      book.send("#{attribute}_url=".to_sym, value[:path]) if book.respond_to? "#{attribute}_url=".to_sym
      book.send("#{attribute}=".to_sym, value[:title]) if book.respond_to? "#{attribute}=".to_sym
      book.save!
    end
  end
end
