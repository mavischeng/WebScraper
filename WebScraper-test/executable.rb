require_relative 'scraper'
usage = []
usage << "\n Usage : executable [number] .\n"
usage << "\nNumber 1 : Hsinchu bus\' stations."
usage << "\n Number 2 : Get bus stataion names."
usage << "\n Number 3 : Get bus stataion information in detail."
usage << "\n Number 4 : Get file (bus stataion information)bus."
#fail ArgumentError, usage if ARGV.count != 1
#number = ARGV[0]
#found= WebScraper.new.busstation
mac= WebScraper.new
found=mac.busstation
puts  found
#selet=mac.tmp_selectstation
#puts  selet



