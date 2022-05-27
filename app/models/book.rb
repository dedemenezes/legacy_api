class Book < ApplicationRecord
  attr_accessor :path

  def build(key, values)
    @next_attribute = prepare_attribute_name(key)
    define_instance_variables(values)
    define_attribute_readers
  end

  def add_attribute(name, value)
    define_instance_variables(value, name)
    define_attribute_readers(name)
  end

  def prepare_attribute_name(string)
    string.gsub(' ', '_')
  end

  private

  def define_attribute_readers(name = nil)
    self.class.define_method("#{name || @next_attribute}_url") do
      instance_variable_get "@#{name || @next_attribute}_url"
    end
    self.class.define_method("#{name || @next_attribute}") do
      instance_variable_get "@#{name || @next_attribute}"
    end
  end

  def define_instance_variables(values, name = nil)
    instance_variable_set "@#{name || @next_attribute}_url", values.first[:url] unless values.first[:url].nil?
    instance_variable_set "@#{name || @next_attribute}", values.first[:data] unless values.first[:data].nil?
  end
end
