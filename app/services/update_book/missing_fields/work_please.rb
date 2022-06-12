module UpdateBook
  module MissingFields
    module WorkPlease
      def self.script
        proc do |book, attribute, value|
          if book.respond_to? "#{attribute.gsub(' ', '_')}_url=".to_sym
            book.send("#{attribute.gsub(' ', '_')}_url=".to_sym, value[:path])
          end

          if book.respond_to? "#{attribute.gsub(' ', '_')}=".to_sym
            book.send("#{attribute.gsub(' ', '_')}=".to_sym, value[:title])
          end
          book.save!
        end
      end
    end
  end
end
