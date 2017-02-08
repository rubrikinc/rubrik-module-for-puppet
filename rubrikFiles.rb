$LOAD_PATH.unshift File.expand_path('../lib/', __FILE__)
require './lib/getFilesetByHostName.rb'

#Give me a hostname and I'll spit back filesets

puts getFilesetByHostName(ARGV[0])
