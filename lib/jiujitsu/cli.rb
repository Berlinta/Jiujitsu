class Jiujitsu::CLI

  def start
    puts "WELCOME TO VENUM"
    logo
    menu
  end

  def menu
    puts "Quality Brazilian Jiu Jitsu GI's"
    puts "Type all to see the list available of GI's"
    #logo
    input = gets.strip.downcase
    case input
    when "all"
        puts "in GI's"
        scrape_gis
        list_gis
        chose_your_gi
      when "close"
        puts "Goodbye"
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
    total = Jiujitsu::Style.all.length
    if input.between?(1,total)
      type = Jiujitsu::Style.all[input-1]
      show_the_gi(type)
    else
      puts "\nPlease select the correct GI"
      list_gis
      chose_your_gi
    end
  end

  def show_the_gi(type)
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
