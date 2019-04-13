class Jiujitsu::Scraper

  def self.scrape_equipment(url)
    website = Nokogiri::HTML(open(url))
    #binding.pry
    #light = website.css("h1.page-title")#.text.gsub("\n","") #Gets categori name
    light = website.css("div.products.wrapper.grid")
    array_of_gis = light.css("a.product-item-link")

    array_of_gis.map do |gi|
      binding.pry
      #break if i == 10 #lists all the gis
      Jiujitsu::Style.new(gi.text, gi.attributes["href"].value)
      #break if i == 10
    end
  end

 def self.scrape_type(type)
    website = Nokogiri::HTML(open(type.url.split("html")[1] + "html"))
    nogi = website.css("div.bottom-product-info")
    nogi.each do |price_link|
      tag = Jiujitsu::Bjj.new
      #assigning object attr
      tag.discount = price_link.css("span.price").text
      puts tag.discount
  end
 end
end
