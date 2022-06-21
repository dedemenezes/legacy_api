module Seeds
  module Traits
    def self.run(traits, house)
      traits.map do |trait|
        trait = Distinction.find_by_content(trait[:title]) || Distinction.new(content: trait[:title], record: house)
        trait.record = house
        trait.save!
      end
    end
  end
end
