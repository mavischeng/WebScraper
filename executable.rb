require_relative 'scraper'
usage = []

fail ArgumentError, usage if ARGV.count != 1
number = ARGV[0]
found= WebScraper.busstation
scmachine = WebScraper.new

  puts scmachine.busstation
  #puts "region  : #{scmachine.@station}"
