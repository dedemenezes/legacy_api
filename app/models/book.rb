# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, uniqueness: { scope: :path, message: 'combination title and url already exist' }

  def add_new_information(key, values)
    @next_attribute = prepare_attribute_name(key)
    define_instance_variables(values)
    # define_attribute_readers
    persist_if_changed
    self
  end

  def add_attribute(name, value)
    define_instance_variables(value, name)
    # define_attribute_readers(name)
  end

  def prepare_attribute_name(string)
    string.tr(' ', '_')
  end

  def self.new_book(hash)
    new_book = new(hash)
    doc_builder = DocBuilder.new path: hash[:path]
    # doc_builder.build_nokogiri_doc_from_url
    new_book.character_index_url = CharacterIndexUrlScraper.new(doc: doc_builder.html_doc).scrape
    infos = InformationsScraper.new(doc: doc_builder.html_doc).scrape_information_box
    infos.each do |key, values|
      new_book.add_new_information(key, values)
    end
    new_book
  end

  private

  def persist_if_changed
    save if changed?
  end
  # def define_attribute_readers(name = nil)
  #   self.class.define_method("#{name || @next_attribute}_url") do
  #     instance_variable_get "@#{name || @next_attribute}_url"
  #   end
  #   self.class.define_method("#{name || @next_attribute}") do
  #     instance_variable_get "@#{name || @next_attribute}"
  #   end
  # end

  def define_instance_variables(values, name = nil)
    attribute_name = name || @next_attribute
    instance_variable_set "@#{attribute_name}_url", values.first[:path] unless values.first[:path].nil?
    instance_variable_set "@#{attribute_name}", values.first[:title] unless values.first[:title].nil?
    define_attr_writer(attribute_name)
  end

  def define_attr_writer(attribute_name)
    send("#{attribute_name}=", instance_variable_get("@#{attribute_name}"))
    send("#{attribute_name}_url=", instance_variable_get("@#{attribute_name}_url"))
  end
end
