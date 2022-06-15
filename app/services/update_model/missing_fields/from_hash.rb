# frozen_string_literal: true

module UpdateModel
  module MissingFields
    module FromHash
      def self.script
        proc do |book, hash|
          missing_attributes_hash(book, hash).each do |box_section_name, values|
            UpdateModel::MissingFields::WorkPlease.script.call(book, box_section_name, values.first)
          end
          book
        end
      end

      # Look iover book attributes and filter scraped information
      # return only the book fields that are nil
      def self.missing_attributes_hash(book, hash)
        missing_fields = book.attributes.select { |_key, value| value.nil? }
        missing_fields = missing_fields.transform_keys { |key| key.gsub('_', ' ') }
        hash.select { |key, _value| missing_fields.keys.include? key }
      end
    end
  end
end
