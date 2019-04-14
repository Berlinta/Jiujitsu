class Jiujitsu::Bjj

  attr_accessor :price

  @@all = []

  def initiaize(price)
    @price = price
    @@all << self
  end

  # def tag_price(tag)
  #   self.prices << tag
  #   tag.type = self
  # end


end
