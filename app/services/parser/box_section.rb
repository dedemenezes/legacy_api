# frozen_string_literal: true

module Parser
  class BoxSection
    attr_accessor :doc

    def initialize(attributes = {})
      @doc = attributes[:doc]
    end

    def build_information_hash
      data = information_content
      url = information_href
      { title: remove_unecessary_text(data), path: url }
    end

    def information_content
      return doc.text.strip if doc.name == 'li'

      item = information_value.text.strip
      item = doc.text.strip if item.empty?
      item = doc.search('img').attr('data-image-name').value if item.empty?
      item
    end

    def information_value
      doc.search('.pi-data-value')
    end

    def information_href
      href = doc.search('a').attr('href')
      href&.value
    end

    def information_list
      information_value.search('ul')
    end

    def information_in_list?
      !information_list.empty?
    end

    def remove_unecessary_text(str)
      str.gsub(/(\[|\().+/, '')
    end

    def list_items
      information_list.search('li').map { |li| li }
    end
  end
end
