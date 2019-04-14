class Jiujitsu::Style

  attr_accessor :name, :url, :price

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end
  #
  # def tag_price(tag)
  #   self.prices << tag
  #   tag.type = self
  # end

end
