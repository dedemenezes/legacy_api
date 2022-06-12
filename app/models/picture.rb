class Picture < ApplicationRecord

  validates :path, presence: true
  belongs_to :imageable, polymorphic: true
  before_validation do
    CleanImageUrl.picture(self)
  end
end
