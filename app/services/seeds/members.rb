# frozen_string_literal: true

module Seeds
  module Members
    def self.run(members, house)
      members.map { |member| seed_member(house, member) }
    end

    def self.seed_member(house, member)
      character = FindBy.name_or_path(Character, member)
      character ||= Seeds::Characters.build_from_path(title: member[:title], path: member[:path])
      Member.create character: character, house: house if character.present?
    end
  end
end
