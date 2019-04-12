class Jiujitsu::CLI


  def start
    puts "Welcome to Venum"
    menu
  end

  def menu
    puts "What type of equipment are you interested in?"
    puts "BJJ GI's, Boxing Gloves, Karate GI's"
    puts "Type either 'bjj', 'boxing', or 'karate'"
    input = gets.strip.downcase
    case input
    when "bjj"
        puts "in GI's"
        scrape_gis
        list_gis
        chose_your_gi
        # puts "Chose another GI you would like to see"
        # # list more options
        # types.each.with_index(1) do |color, index|
        #   puts "#{index}. #{color.name}"
        # end
        # puts types[1].name
        # puts types[1].url
      when "boxing"
        puts "in boxing"
      when "karate"
        puts "in karate"
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

  end


  def scrape_gis
    url = "https://www.venum.com/sports/bjj/bjj-gis.html"
    types = Jiujitsu::Scraper.scrape_equipment(url)
    end
  end
