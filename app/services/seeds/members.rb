module Seeds
  module Members
    def self.run(house, member)
      character = FindBy.name_or_path(Character, member)
      character ||= Seeds::Characters.build_from_path(title: member[:title], path: member[:path])
      Member.create character: character, house: house if character.present?
    end
  end
end
