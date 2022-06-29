# frozen_string_literal: true

class RelatedCreatureType < ApplicationRecord
  belongs_to :main, class_name: 'CreatureType'
  belongs_to :related, class_name: 'CreatureType'
end
