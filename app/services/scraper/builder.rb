module Scraper
  class Builder
    attr_reader :url, :doc

    def initialize(url:)
      @url = url
      @doc = nokogiri_doc
    end

    def nokogiri_doc
      response = Net::HTTP.get_response(URI("#{Scraper::DocBuilder::BASE_URL}#{url}"))
      doc = Nokogiri::HTML(response.body)
      builder = Scraper::DocBuilder.new
      builder.html_doc = doc
      builder
    end
  end
end
