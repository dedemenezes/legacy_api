module UpdateBook
  module MissingFields
    def self.call(hash, book)
      # check present attributes
      clean_attr = book.attributes.select { |_key, value| value.nil? }
      clean_attr = clean_attr.map { |k, v| [k.gsub('_', ' '),v] }.to_h
      missing_attributes_hash = hash.select { |key, _value| clean_attr.keys.include? key }
      # book_attributes = missing_attributes_hash.map { |key, value| [key, value.first[:title]] }.to_h
      p missing_attributes_hash
      puts "#" * 13
      missing_attributes_hash.each do |attribute, values|
        attribute = attribute.gsub(' ', '_') if attribute.include? ' '
        book.send("#{attribute}_url=".to_sym, values.first[:path]) if book.respond_to? "#{attribute}_url=".to_sym
        book.send("#{attribute}=".to_sym, values.first[:title])
      end
      book.save!
      # get from hash atributes missing
    end
  end
end
