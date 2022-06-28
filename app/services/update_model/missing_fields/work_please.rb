# frozen_string_literal: true

module UpdateModel
  module MissingFields
    # service too assign attributes into book
    module WorkPlease
      def self.script
        proc do |any_instance, attribute, value|
          if any_instance.respond_to? "#{attribute.gsub(' ', '_')}_url=".to_sym
            any_instance.send("#{attribute.gsub(' ', '_')}_url=".to_sym, value[:path])
          end

          if any_instance.respond_to? "#{attribute.gsub(' ', '_')}=".to_sym
            any_instance.send("#{attribute.gsub(' ', '_')}=".to_sym, value[:title])
          end
          # any_instance.save!
        end
      end
    end
  end
end
