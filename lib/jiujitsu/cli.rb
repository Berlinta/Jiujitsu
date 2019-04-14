class Jiujitsu::CLI

  attr_accessor :gi

  def start
    puts "WELCOME TO VENUM"
    logo
    menu
  end

  def menu
    puts "Quality Brazilian Jiu Jitsu GI's"
    puts "Type all to see the list available of GI's"
    puts "Type close to exit"
    input = gets.strip.downcase
    case input
    when "all"
        puts "Select the GI to get the price"
        scrape_gis
        list_gis
        chose_your_gi
        show_price
      when "close"
        puts "Thank you for checking out our selection."
      else
        puts "INVALID SELECTION"
        menu
    end
  end

  def list_gis
    Jiujitsu::Style.all.each.with_index(1) do |color, index|
      puts "#{index}. #{color.name}"
    end
  end

  def chose_your_gi
    puts "Select another GI with the correct number:"
    input = gets.strip.to_i
    @gi = Jiujitsu::Style.all[input-1]
    #binding.pry
  end

  def get_price
    Jiujitsu::Scraper.scrape_price(self.gi)
  end

  def show_price
    puts "This is the price for this model: #{get_price}"
    #binding.pry
  end

  def show_the_gi(type)
    Jiujitsu::Scraper.scrape_type(type)

    #binding.pry
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
