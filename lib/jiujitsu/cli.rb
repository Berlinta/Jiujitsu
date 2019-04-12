class Jiujitsu::CLI


  def start
    puts "Welcome to Venum"
    puts "What type of equipment are you interested in?"
    puts "BJJ, Boxing, Karate"
    puts "Type either 'bjj', 'boxing', or 'karate'"
    input = gets.strip.downcase
    case input
    when "bjj"
        puts "in bjj"
        url = "https://www.venum.com/sports/bjj/bjj-gis.html"
        types = Jiujitsu::Scraper.scrape_equipment(url)
        puts types[1]
      when "boxing"
        puts "in boxing"
      when "karate"
        puts "in karate"
      when "close"
        puts "Goodbye"
      else
        puts "no such option"
    end
  end
end
