class Character < ApplicationRecord

  def self.generate_attribute_hash(infos)
    infos.map { |k, v| [[attribute_name(k).to_sym, v.first[:title]], ["#{attribute_name(k)}_url".to_sym, v.first[:path]]] }
         .map(&:to_h)
         .reduce(:merge)
         .compact
         .reject { _2.include? "#" }
  end

  def self.attribute_name(key)
    key == 'alias' ? 'nickname' : key
  end
end
