# frozen_string_literal: true

module CleanImageUrl
  def self.script
    proc do |record|
      match_data = record.image_url.match(/.+\.(jpg|png|bmp|gif)/i) if record.image_url.present?
      record.image_url = match_data[0] if match_data.present?
    end
  end

  def self.picture(record)
    match_data = record.path.match(/.+\.(jpg|png|bmp|gif)/i) if record.path.present?
    record.path = match_data[0] if match_data.present?
  end
end
