module Seeds
  module CreatureTypes
    class BuildCreatureType
      attr_reader :infos_hash

      def initialize(attributes = {})
        @path = attributes[:path]
      end

      def from_path
        infos
        build_instance
        assign_distinctions
        assign_creature_type_image
        begin
          @creature_type.save!
        rescue => exception
          puts "#{@creature_type.errors.messages} beign fixed..."
          name = @creature_type.path.match(/\/wiki\/(?<name>.+)/)[:name]
          puts name
          @creature_type.name = name
          p @creature_type
          @creature_type.save!
        end
        @creature_type
      end

      private

      def infos
        # response = Net::HTTP.get_response(URI("#{Scraper::DocBuilder::BASE_URL}#{@path}"))
        # doc = Nokogiri::HTML(response.body)
        builder = Scraper::DocBuilder.new path: @path
        # builder.html_doc = doc
        @information_parser = Parser::BoxInformation.new(doc: builder.html_doc)
        @infos_hash = @information_parser.scrape_information_box
        @infos_hash['path'] = [{ path: @path }]
        @infos_hash
      end

      def build_instance(url = @path)
        @creature_type = CreatureType.new(path: url)
        @creature_type = UpdateModel::MissingFields::FromHash.script.call(@creature_type, @infos_hash)
        # @creature_type.save!
        self
      end

      def assign_distinctions
        @infos_hash['distinction']&.each do |distinction|
          Distinction.create content: distinction[:title], creature_type: @creature_type
        end
        self
      end

      def assign_creature_type_image
        return unless @infos_hash['image'].present?

        image_attributes = @infos_hash['image'].first
        puts "Assigning #{image_attributes[:path]} using Picture polymorphic model..."
        pic = Picture.new(image_attributes)
        pic.imageable = @creature_type
        pic.save!
        puts "Picture polymorphic model assigned. #{pic.path}"
        self
      end
    end
  end
end
