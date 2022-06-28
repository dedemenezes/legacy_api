# frozen_string_literal: true

module Seeds
  module Houses
    class BuildHouse
      include FindBy
      include Members
      include Heads
      include Traits
      include ActionView::Helpers::TextHelper

      attr_reader :house, :infos

      def initialize(attributes = {})
        @parser = attributes[:parser]
        @url = attributes[:url]
        infos_hash if @parser
      end

      def now
        @house = House.find_by(name: infos['name'].first[:title])
        return if @house

        @house = House.new path: @url
        UpdateModel::MissingFields::FromHash.script.call(house, infos)
        house.save!
      end

      def done
        puts "#{house.name} created! containing: #{pluralize(house.members.count,'member')}, #{pluralize(house.heads.count, 'header')}, #{pluralize(house.distinctions.count, 'trait')}"
      end

      def assing_members
        puts 'Assigning members...'
        members = Members.assign(infos['members'], house) if infos['Members'.downcase].present?
        puts "#{house.name} has #{members.compact.size} members"
      end

      def assign_heads
        puts 'Assigning heads...'
        Heads.run(infos['head'], house) if infos['Head'.downcase].present?
        puts "Last header is #{Head.last.header.name}"
      end

      def assign_traits
        puts 'Assigning traits...'
        Traits.run(infos['traits'], house) if infos['Traits'.downcase].present?
        puts house.traits_to_s
      end

      private

      def infos_hash
        @infos = @parser.scrape_information_box
      end
    end
  end
end
