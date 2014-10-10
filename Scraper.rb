require 'open-uri'
require 'nokogiri'
# Class that can be used to grab data from website(http://www.hcbus.com.tw/)
class WebScraper
  # @data stores information
  attr_accessor :data
  def initialize
    @data = data
  end

  def getwebstructure(website)
    web_data = open(website)
    @data = Nokogiri.HTML(web_data)
    File.write('Structure.txt', @data)
  end

  def busstation
    getwebstructure('http://www.hcbus.com.tw/big5/service.asp')
    @data.css("select[name='jumpMenu'] option").each do |x|
      puts 'Station : ' << x.text
    end
  end
end
