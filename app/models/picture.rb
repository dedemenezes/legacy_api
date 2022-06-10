class Picture < ApplicationRecord
  validates :path, presence: true
  belongs_to :imageable, polymorphic: true
  after_validation :clean_url

  private

  def clean_url
    return unless path

    self.path = path.match(/.+\.(jpg|png|bmp)/i)
  end
end
