# frozen_string_literal: true

require "rails_helper"

RSpec.describe Book, type: :model do
  describe "#prepare_attribute_name" do
    it "remove whitespace and add `_`" do
      book = Book.new
      actual = book.prepare_attribute_name("meta programming")
      expected = "meta_programming"
      expect(actual).to eq expected
    end
  end

  describe "#add_new_information" do
    key = "image"
    url = "https://image.com"
    values = [{data: key, path: url}]
    book = Book.new
    book.add_new_information(key, values)

    it "add new value instance variable" do
      variables = book.instance_variables
      actual = variables.include? "@#{key}".to_sym
      expect(actual).to be_truthy
    end

    it "add new value to instance variable with url sufix" do
      book.add_new_information(key, values)
      expect { book.image_url }.not_to raise_error
      expect(book.image_url).to be_a(String)
      expect(book.image_url).to eq(url)
    end

    # it 'add new attribute reader' do
    #   expect { book.image }.not_to raise_error
    #   expect(book.image).to be_a(String)
    #   expect(book.image).to eq(key)
    # end
  end
end
