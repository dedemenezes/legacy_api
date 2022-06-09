class Picture < ApplicationRecord
  validates :path, presence: true
  belongs_to :imageable, polymorphic: true
  before_save :clean_url

  private

  def clean_url
    self.path = path.match(/(?<image_url>.+\.[jpg|png|bmp])/i)['image_url']
  end
end
