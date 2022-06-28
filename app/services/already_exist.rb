# frozen_string_literal: true

class AlreadyExist
  def self.instance?(klass, url)
    klass.find_by(path: url).present?
  end
end
