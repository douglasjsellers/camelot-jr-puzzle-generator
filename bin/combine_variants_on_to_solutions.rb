require 'mini_magick'

originals_directory = ARGV.first
@variants_directories = "#{originals_directory}variants/"

def find_puzzle_id( file )
  file.split( '_').last.split( '.' ).first
end

def find_variants( puzzle_id )
  variants = Dir["#{@variants_directories}#{puzzle_id}.solution_*.png"]
end

files = Dir["#{originals_directory}solution_*.png"]

files.each do |file|
  solution_image = MiniMagick::Image.open(file)

  puzzle_id = find_puzzle_id( file )
  variants = find_variants( puzzle_id )
  puts "#{file} has variants #{variants.join(',')}" unless variants.empty?

  # crop with 1184x1138+119+245
  offset = 1200
  variants.each do |variant|
    variant_image = MiniMagick::Image.open(variant)
    variant_image.crop( "1184x1138+119+245" )
    variant_image = variant_image.combine_options do |c|
      c.fuzz "8%"
      c.transparent( "#b4dbe5" )
    end    

    variant_image = variant_image.combine_options do |c|
      c.fuzz "10%"
      c.transparent( "#6a95bf" )
    end    

    variant_image = variant_image.combine_options do |c|
      c.fuzz "10%"
      c.transparent( "#a6bac8" )
    end
    variant_image = variant_image.resize( "20%" )

    solution_image = solution_image.composite( variant_image ) do |c|
        c.compose "Over"
        c.geometry( "+#{offset}+50" )
    end

    offest -= 300
  end
  solution_image.format( 'png' )
  solution_image.write( file )
  
end
