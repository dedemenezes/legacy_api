# frozen_string_literal: true

module Seeds
  module Houses
    module Traits
      def self.run(traits, house)
        traits.map do |trait|
          trait = Distinction.new(content: trait[:title], record: house)
          trait.record = house
          trait.save!
        end
      end
    end
  end
end
