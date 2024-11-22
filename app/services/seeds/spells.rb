module Seeds
  module Spells
    def self.run
      doc = Scraper::DocBuilder.new(path: '/wiki/List_of_spells').html_doc
      spells = doc.search('.mw-headline i a').map do |el|
        Scraper::HashBuilder.from_link(el)
      end
      spell_infos = spells.map { |spell| scrape_spell(spell) }
      spell_infos.each { |spell_info| create_spell(spell_info) }
    end

    def self.scrape_spell(spell)
      spell_doc = Scraper::DocBuilder.new(path: spell[:path]).html_doc
      info = Parser::BoxInformation.new(doc: spell_doc).scrape_information_box
      { spell[:title] => info }
    end

    def self.create_spell(spell_info)
      name, spell_attributes = retrieve_name_and_attributes(spell_info)
      spell = build_spell(name, spell_attributes)
      spell.save!
    end

    def self.retrieve_name_and_attributes(spell_info)
      [spell_info.keys.first, spell_info.values.first]
    end

    def self.build_spell(name, spell_attributes)
      spell = Spell.new(name: name)
      spell.image_url = fetch_attribute_from('image', spell_attributes)
      spell.incantation = fetch_attribute_from('incantation', spell_attributes)
      spell.kind = fetch_attribute_from('type', spell_attributes)
      spell.light = fetch_attribute_from('light', spell_attributes)
      spell.effect = fetch_attribute_from('effect', spell_attributes)
      spell.base_type = fetch_attribute_from('base type', spell_attributes)
      spell.hand_url = fetch_attribute_from('hand', spell_attributes)
      spell
    end

    def self.fetch_attribute_from(name, spell_attributes)
      return spell_attributes.fetch(name, [{ path: nil }]).first[:path] if %w[image hand].include?(name)

      spell_attributes.fetch(name, [{ title: nil }]).first[:title]
    end
  end
end
