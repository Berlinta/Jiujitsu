class Jiujitsu::Scraper

  def self.scrape_equipment(url) #SHOW ALL THE AVAILABLE GIs
    website = Nokogiri::HTML(open(url))
    light = website.css("div.products.wrapper.grid")
    array_of_gis = light.css("a.product-item-link")
    array_of_gis[0..9].each do |gi|
      Jiujitsu::Style.new(gi.text, gi.attributes["href"].value)
    end
  end

 def self.scrape_type(type) #SCRAPES THE PRICE
    website = Nokogiri::HTML(open(type.url.split("html")[1] + "html"))
    nogi = website.css("div.bottom-product-info")
    nogi.each do |price_link|
      tag = Jiujitsu::Bjj.new
      tag.discount = price_link.css("span.price").text
      puts tag.discount
  end
 end
end
