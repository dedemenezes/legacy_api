# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  SKIP_IMAGE_VALIDATION_TO = [
    Member,
    Artist,
    CreatureType,
    Distinction,
    Picture,
    RelatedCreatureType,
    Head,
    Wiki
    # BookArtist
  ].freeze

  include CleanImageUrl

  before_validation do
    CleanImageUrl.script.call(self) unless SKIP_IMAGE_VALIDATION_TO.include? self.class
  end
end
