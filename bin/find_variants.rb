require 'mini_magick'

directory_to_scan = ARGV.first

files = Dir["#{directory_to_scan}puzzle_*.png"]
signature_to_variants = {}

files.each do |file|
  image = MiniMagick::Image.open(  file )
  signature = image.signature
  if( signature_to_variants[signature].nil? )
    signature_to_variants[signature] = []
  else
    root_image = signature_to_variants[signature].first
    this_puzzle_id = file.split( '_').last.split( '.' ).first
    root_puzzle_id = root_image.split( '_').last.split( '.' ).first
    `mv #{file} #{directory_to_scan}variants/#{root_puzzle_id}.puzzle_#{this_puzzle_id}.png`
    `mv #{directory_to_scan}solution_#{this_puzzle_id}.png #{directory_to_scan}variants/#{root_puzzle_id}.solution_#{this_puzzle_id}.png`
    
  end
  signature_to_variants[signature] << file
end

signature_to_variants.each do |key,value|
  puts "#{key} = #{value.join( ',' )}"
end


