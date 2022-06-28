# frozen_string_literal: true

module RetrieveUrls
  def self.script(klass, attribute_url)
    klass.to_s.downcase.capitalize.constantize.pluck(attribute_url).uniq.compact
    # Character.pluck(:species_url).uniq.compact
  end
end
