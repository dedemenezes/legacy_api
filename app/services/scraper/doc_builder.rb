# frozen_string_literal: true

module Scraper
  # service to parse any page from harry potter fandom
  class DocBuilder
    BASE_URL = 'https://harrypotter.fandom.com'
    attr_writer :path
    attr_accessor :html_doc

    def initialize(attributes = {})
      @path = attributes[:path]
      @file_path = attributes[:file_path]
      build_nokogiri_doc_from_url if @path
      build_nokogiri_doc_from_file if @file_path
    end

    def build_nokogiri_doc_from_url
    # response = Net::HTTP.get_response(URI("#{Scraper::DocBuilder::BASE_URL}#{url}"))
    # response = Faraday.get("#{BASE_URL}#{@path}")
    # response = Faraday.get(response['location']) if response.status == 301
      response = Net::HTTP.get_response(URI("#{BASE_URL}#{@path}"))
      html_file = response.body
      @html_doc = Nokogiri::HTML(html_file)
      @html_doc
    end

    def build_nokogiri_doc_from_file
      html_file = File.read(@file_path)
      @html_doc = Nokogiri::HTML(html_file)
    end

    def doc_has_table?
      !@html_doc.search('.article-table').empty?
    end
  end
end
