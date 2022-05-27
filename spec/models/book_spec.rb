require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#prepare_attribute_name' do
    it 'remove whitespace and add `_`' do
      book = Book.new
      actual = book.prepare_attribute_name('meta programming')
      expected = 'meta_programming'
      expect(actual).to eq expected
    end
  end

  describe '#add_new_information' do
    key = 'banner'
    url = 'https://banner.com'
    values = [{ data: key, url: url }]
    book = Book.new
    book.add_new_information(key, values)

    it 'add new instance variable' do
      variables = book.instance_variables
      actual = variables.include? "@#{key}".to_sym
      expect(actual).to be_truthy
    end

    it 'add new instance variable with url sufix' do
      book.add_new_information(key, values)
      expect { book.banner_url }.not_to raise_error
      expect(book.banner_url).to be_a(String)
      expect(book.banner_url).to eq(url)
    end

    it 'add new attribute reader' do
      expect { book.banner }.not_to raise_error
      expect(book.banner).to be_a(String)
      expect(book.banner).to eq(key)
    end
  end
end
