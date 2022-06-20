# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include CleanImageUrl

  before_validation do
    CleanImageUrl.script.call(self)
  end
end
