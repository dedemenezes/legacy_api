module UpdateBook
  module MissingFields
    AsHash = proc do
      missing_attributes_hash(book, hash).each do |box_section_name, values|
        Assign.call(book, box_section_name, values.first)
      end
    end

    def self.missing_attributes_hash(book, hash)
      missing_fields = book.attributes.select { |_key, value| value.nil? }
      missing_fields = missing_fields.transform_keys { |key| key.gsub('_', ' ') }
      missing_attributes_hash = hash.select { |key, _value| missing_fields.keys.include? key }
    end
  end
end
