require 'open-uri'
require 'nokogiri'
# Class that can be used to grab data from website(http://www.hcbus.com.tw/)
class WebScraper
  # @data stores information
  attr_accessor :data
  attr_accessor :station
  def initialize
    @data = data
    @station = station
  end

  def getwebstructure(website)
    web_data = open(website)
    @data = Nokogiri.HTML(web_data)
    File.write('Structure.txt', @data)
  end

  def busstation
    num, @station = 1, []
    getwebstructure('http://www.hcbus.com.tw/big5/service.asp')
    @data.css("select[name='jumpMenu'] option").each do |x|
      @station << x.text
      puts 'Station ' << num.to_s << ' : ' << x.text
      num += 1
    end
  end

  def selectstation
    busstation
    puts 'Please select a station (1,2,3.....)'
    select_station = $stdin.gets.chomp
    puts (select_station.to_i >= 0 && select_station.to_i <= @station.length) ? station[select_station.to_i - 1] : '[ERROR] Please select provided number above.'
  end
end
