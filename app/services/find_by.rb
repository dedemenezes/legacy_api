module FindBy
  def self.name_or_path(klass, hash)
    klass.find_by_name(hash[:title]) || klass.find_by_path(hash[:path])
  end
end
