directory_to_scan = ARGV.first

files = Dir["#{directory_to_scan}*.puzzle_*.png"]

files.each do |file|
  puts file
  split_file = file.split( '.' )
  split_file = split_file[1..2]
  
  `mv #{file} #{directory_to_scan}#{split_file.join( '.' )}`
end

