require 'open-uri'
require 'nokogiri'
require 'rubygems'
require 'mechanize'
# Class that can be used to grab data from website(http://www.hcbus.com.tw/)
class WebScraper
  # @data stores information
  attr_accessor :data
  attr_accessor :station
  attr_accessor :page
  def initialize
    @data = data
    @station = station
    @page = page
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
    selectdropdown(select_station.to_i - 1)
  end

  def selectdropdown(num)
    url = 'http://www.hcbus.com.tw/big5/service.asp'
    agent = Mechanize.new
    page = agent.get(url)
    form = agent.page.forms.first
    form.field_with(:name => 'jumpMenu').options[num.to_i].click
    page2 = form.submit
    @page = page2
    getinformation
  end

  def getinformation
    key = [], value = []
    title = @page.parser.xpath("//table/tr[@class='text1_white']/td")
    content = @page.parser.xpath("//table/tr/td[@class='map-style']")
    title.each {|t| key << t.text.strip}
    content.each {|c| value << c.text.strip}
    makehash(key, value)
  end
  def makehash(key, value)
    key.each {|k| puts k}
    value.each {|v| puts v}
  end
end
