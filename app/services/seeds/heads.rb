module Seeds
  module Heads
    def self.run(heads, house)
      heads.map do |header|
        char = FindBy.name_or_path(Character, header)
        Head.create header: char, house: house if char
      end
    end
  end
end
