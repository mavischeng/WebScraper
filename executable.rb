# User Interface (takes user input from the user at the command line)

require_relative 'Scraper'

usage = "\n Usage : executable [number] .\n\n Number 1 : Hsinchu bus\' stations. \n Number 2 : Get bus stataion names."
fail ArgumentError, usage if ARGV.count != 1

number = ARGV[0]

scmachine = WebScraper.new

case number
  when '1'
    scmachine.getwebstructure('http://www.hcbus.com.tw')
  when '2'
    scmachine.busstation
  when '3'
    scmachine.selectstation
  
  else
    puts 'Error : No' << number.to_s
end
