class InfoBoxScraper
  attr_reader :informations

  def initialize(attributes = {})
    @doc = attributes[:doc]
    @informations = {}
  end
end
