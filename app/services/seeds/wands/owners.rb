module Seeds
  module Wands
    module Owners
      def run(infos, wand)
        masters_names = infos['masters']&.map { _1[:title] }

        if infos['owners']
          puts 'Assigning owners'
          owners = infos['owners']
          owners = owners.reject { |h| masters_names.include? h[:title] } if infos['masters']
          owners.each do |owner|
            owner = Character.find_by(path: owner[:path])
            WandOwner.create! wand: wand, character: owner if owner
          end
          puts "#{owners.count} owners assigned"
        end
      end
    end
  end
end
