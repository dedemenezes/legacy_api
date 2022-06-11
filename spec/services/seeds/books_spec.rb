# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seeds::Books, type: :service do
  describe "#run" do
    context 'Books' do
      it 'populate database with 1 books' do
        counter = Book.count
        expect(counter).to eq(0)
        Seeds::Books.run(1)
        expect(Book.count).to eq(1)
      end
    end
  end
end
