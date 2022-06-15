# frozen_string_literal: true

module Seeds
  module Wands
    module Masters
      def self.run(infos, wand)
        puts 'assigning master...'
        wand_master = WandMaster.new
        wand_master.assign_master(infos)
        wand_master.assign_wand(wand) if wand_master.changed?
        wand_master.save
        puts "Master: #{wand_master.character.name}" if wand_master.persisted?
      end
    end
  end
end
