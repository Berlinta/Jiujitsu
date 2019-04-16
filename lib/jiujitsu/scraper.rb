class Jiujitsu::Scraper

  def self.scrape_equipment(url) #SCRAPES GIs
    website = Nokogiri::HTML(open(url))
    light = website.css("div.products.wrapper.grid")
    array_of_gis = light.css("a.product-item-link")
    array_of_gis[0..10].each do |gi|
      text = gi.text
      url = gi.attributes["href"].value         #.split("html")[1] + "html"
      Jiujitsu::Style.new(text, url)
    end
  end

 def self.scrape_price(obj) #SCRAPES THE PRICE
    website = Nokogiri::HTML(open(obj.url))
    obj.price = website.css(".price").first.text
 end
end
