# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Character, type: :model do
  describe '#right_attributes' do
    it 'returns right hash of attributes' do
      attributes = { name: 'Francis', wand: 'Wand' }
      actual = Character.right_attributes(attributes)
      expect(actual).to eq({ name: 'Francis' })
    end
  end

  describe '#clean_image_url' do
    %w[jpg png gif bmp].each do |extension|
    context "Extension #{extension.upcase}" do
        it "remove everything from the url after .#{extension}" do
          url = "http:///www.image_from_google.com.br/banner.#{extension}/simple_example_1233"
          Character.create name: 'Harry', path: 'wiki/harry', image_url: url
          expect(Character.last.image_url).to eq("http:///www.image_from_google.com.br/banner.#{extension}")
        end
      end
    end
  end
end
