# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocBuilder, type: :service do
  describe '#initialize' do
    context 'when passed url' do
      it 'create an accessible html_doc' do
        doc = DocBuilder.new(url: '/wiki/Harry_Potter_(book_series)')
        expect { doc.html_doc }.not_to raise_error
      end
    end
  end

  describe '#doc_has_table?' do
    it 'returns true when wanted information organized as table' do
      builder = DocBuilder.new(path: '/wiki/Harry_Potter_and_the_Deathly_Hallows_(character_index)')
      actual = builder.doc_has_table?
      expect(actual).to be_truthy
    end
    it 'returns false when wanted information organized as list' do
      builder = DocBuilder.new(path: '/wiki/Harry_Potter_and_the_Philosopher%27s_Stone_(character_index)')
      actual = builder.doc_has_table?
      expect(actual).to be_falsey
    end
  end
end
