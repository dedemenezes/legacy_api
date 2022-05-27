class Book < ApplicationRecord
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
    string.gsub(' ', '_')
  end

  def self.new_book(hash)
    new_book = new(hash)
    binding.pry
    doc_builder = DocBuilder.new path: hash[:path]
    # doc_builder.build_nokogiri_doc_from_url
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
    instance_variable_set "@#{name || @next_attribute}_url", values.first[:url] unless values.first[:url].nil?
    instance_variable_set "@#{name || @next_attribute}", values.first[:data] unless values.first[:data].nil?
    send("#{name || @next_attribute}=", instance_variable_get("@#{name || @next_attribute}"))
    send("#{name || @next_attribute}_url=", instance_variable_get("@#{name || @next_attribute}_url"))
  end
end
