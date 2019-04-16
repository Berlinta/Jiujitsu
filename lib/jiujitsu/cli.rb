class Jiujitsu::CLI

  attr_accessor :gi

  def start
    puts "WELCOME TO VENUM"
    logo
    menu
  end

  def menu
    puts "Quality Brazilian Jiu Jitsu GI's"
    puts "Type ALL to see the list available of GI's"
    puts "Type CLOSE to exit"
    input = gets.strip.downcase
    case input
      when "all"
        puts "Select the GI to get the price tag"
        scrape_gis
        list_gis
        chose_your_gi
        show_price
        other
      when "close"
        puts "Thank you for checking out our selection."
      else
        puts "INVALID SELECTION"
    end
  end

  def other
    puts "Type BACK to return to the menu"
    puts "Type OTHER to get check another model"
    input = gets.strip.downcase
    case input
    when "back"
      logo
      menu
    when "other"
      scrape_gis
      list_gis
      chose_your_gi
      show_price
      other
    when "close"
      puts "Thank you for checking out our selection."
    else
      puts "INVALID SELECTION"
    end
  end

  def list_gis #LIST ALL THE MODELS
    Jiujitsu::Style.all.take(10).each.with_index(1) do |color, index|
      puts "#{index}. #{color.name}"
    end
  end

  def chose_your_gi #PICK A SPECIFIC MODEL
    puts "Select the GI with the correct number:"
    input = gets.strip.to_i
    @gi = Jiujitsu::Style.all[input-1]
    #binding.pry
  end

  def get_price #GET THE PRICE
    Jiujitsu::Scraper.scrape_price(self.gi)
  end

  def show_price #SHOW PRICE
    puts "The price for this model is: #{get_price}"
    #binding.pry
  end

  def show_the_gi(type) #SHOW THE MODEL
    Jiujitsu::Scraper.scrape_type(type)
  end

  def scrape_gis
    url = "https://www.venum.com/sports/bjj/bjj-gis.html"
    types = Jiujitsu::Scraper.scrape_equipment(url)
  end

 def logo
   puts "##     ## ######## ##    ## ##     ## ##     ##
##     ## ##       ###   ## ##     ## ###   ###
##     ## ##       ####  ## ##     ## #### ####
##     ## ######   ## ## ## ##     ## ## ### ##
 ##   ##  ##       ##  #### ##     ## ##     ##
  ## ##   ##       ##   ### ##     ## ##     ##
   ###    ######## ##    ##  #######  ##     ## "
 end
end
