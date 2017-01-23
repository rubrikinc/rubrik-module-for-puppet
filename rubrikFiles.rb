require './lib/getFilesetByHostName.rb'

#Give me a hostname and I'll spit back filesets

puts getFilesetByHostName(ARGV[0])
