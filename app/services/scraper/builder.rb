module Scraper
  module Builder
    def self.using_net_and_uir(url)
      response = Net::HTTP.get_response(URI("#{Scraper::DocBuilder::BASE_URL}#{url}"))
      doc = Nokogiri::HTML(response.body)
      builder = Scraper::DocBuilder.new
      builder.html_doc = doc
      builder
    end
  end
end
