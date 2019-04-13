class Jiujitsu::Style

  attr_accessor :name, :url
  @@all = []

  def initialize(name, url)
    @name = name
    @url = "https://www.venum.com/sports/bjj/bjj-gis.html" + url
    @@all << self
  end

  def self.all
    @@all
  end
end
