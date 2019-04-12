class Jiujitsu::CLI


  def start
    puts "Welcome to Venum"
    menu
  end

  def menu
    puts "What GI are you interested in?"
    puts "Type bjj to see the list of GI's"
    input = gets.strip.downcase
    case input
    when "bjj"
        puts "in GI's"
        scrape_gis
        list_gis
        chose_your_gi
      when "close"
        puts "Goodbye"
      else
        puts "no such option"
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
      show_the_gi(input)
      # okay
    else
      puts "\nPlease select the correct GI"
      list_gis
      chose_your_gi
    end
  end

  def show_the_gi(type)
    binding.pry
    Jiujitsu::Scraper.scrape_type(type)
  end


  def scrape_gis
    url = "https://www.venum.com/sports/bjj/bjj-gis.html"
    types = Jiujitsu::Scraper.scrape_equipment(url)
    end
  end
