class Jiujitsu::Scraper

  def self.scrape_equipment(url)
    website = Nokogiri::HTML(open(url))
    #binding.pry
    #light = website.css("h1.page-title")#.text.gsub("\n","") #Gets categori name
    light = website.css("div.products.wrapper.grid")
    array_of_gis = light.css("a.product-item-link")

    array_of_gis.map do |gi|
      #binding.pry
      Jiujitsu::Style.new(gi.text, gi.attributes["href"].value)
    end
    #return will be an array of objects
  end

 def self.scrape_type(type)
   website = Nokogiri::HTML(open())
 end

end
