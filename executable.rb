require_relative 'scraper'
usage = []
usage << "\n Usage : executable [number] .\n"
usage << "\nNumber 1 : Hsinchu bus\' stations."
usage << "\n Number 2 : Get bus stataion names."
usage << "\n Number 3 : Get bus stataion information in detail."
usage << "\n Number 4 : Get file (bus stataion information)bus."
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
when '4'
  scmachine.file_output
else
  puts '(1~4) Error input : you key in No ' << number.to_s
end
