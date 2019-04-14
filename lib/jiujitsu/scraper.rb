class Jiujitsu::Scraper

  def self.scrape_equipment(url) #SHOW ALL THE AVAILABLE GIs
    website = Nokogiri::HTML(open(url))
    light = website.css("div.products.wrapper.grid")
    array_of_gis = light.css("a.product-item-link")
    array_of_gis[0..9].each do |gi|
      text = gi.text
      url = gi.attributes["href"].value#.split("html")[1] + "html"
      Jiujitsu::Style.new(text, url)
    end
    #binding.pry
  end

 def self.scrape_price(obj) #SCRAPES THE PRICE
    website = Nokogiri::HTML(open(obj.url))
    obj.price = website.css(".price").first.text
    #binding.pry
 end
end
