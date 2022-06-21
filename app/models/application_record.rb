# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  SKIP_IMAGE_VALIDATION_TO = [
    Member,
    Artist,
    BookArtist,
    CreatureType,
    Distinction,
    Picture,
    RelatedCreatureType,
    Head
  ].freeze

  include CleanImageUrl

  before_validation do
    CleanImageUrl.script.call(self) unless SKIP_IMAGE_VALIDATION_TO.include? self.class
  end
end
