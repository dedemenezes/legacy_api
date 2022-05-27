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
end
