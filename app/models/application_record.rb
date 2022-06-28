# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include CleanImageUrl

  before_validation do
    unless [
      Member,
      Artist,
      CreatureType,
      Distinction,
      Picture,
      RelatedCreatureType,
      Head,
      BookArtist,
      WandMaster,
      WandOwner,
      Wiki
    ].include? self.class
      CleanImageUrl.script.call(self)
    end
  end
end
