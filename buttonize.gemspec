Gem::Specification.new do |s|
  s.name      = "buttonize"
  s.version   = "0.1.3"
  s.date      = "2009-01-25"
                
  s.authors   = ["Flurin Egger"]
  s.email     = "f.p.egger@gmail.com"
  s.summary   = "A button generation tool for web applications."
  s.homepage  = "http://github.com/flurin/buttonize"
  
  s.files     = %w( bin/buttonize
                    buttonize.gemspec
                    examples/buttons.rb
                    examples/default/big_blue_left.gif
                    examples/default/big_blue_middle.gif
                    examples/default/big_blue_right.gif
                    examples/default/big_green_left.gif
                    examples/default/big_green_middle.gif
                    examples/default/big_green_right.gif
                    examples/default/big_orange_left.gif
                    examples/default/big_orange_middle.gif
                    examples/default/big_orange_right.gif
                    examples/default/big_red_left.gif
                    examples/default/big_red_middle.gif
                    examples/default/big_red_right.gif
                    examples/default/fonts/Bitstream Vera License.txt
                    examples/default/fonts/Vera-Bold-Italic.ttf
                    examples/default/fonts/Vera-Bold.ttf
                    examples/default/fonts/Vera-Italic.ttf
                    examples/default/fonts/Vera.ttf
                    examples/default/small_blue_left.gif
                    examples/default/small_blue_middle.gif
                    examples/default/small_blue_right.gif
                    examples/default/small_green_left.gif
                    examples/default/small_green_middle.gif
                    examples/default/small_green_right.gif
                    examples/default/small_orange_left.gif
                    examples/default/small_orange_middle.gif
                    examples/default/small_orange_right.gif
                    examples/default/small_red_left.gif
                    examples/default/small_red_middle.gif
                    examples/default/small_red_right.gif
                    examples/default/styles.rb
                    examples/default/table_blue_left.gif
                    examples/default/table_blue_middle.gif
                    examples/default/table_blue_right.gif
                    examples/default/table_green_left.gif
                    examples/default/table_green_middle.gif
                    examples/default/table_green_right.gif
                    examples/default/table_orange_left.gif
                    examples/default/table_orange_middle.gif
                    examples/default/table_orange_right.gif
                    examples/default/table_red_left.gif
                    examples/default/table_red_middle.gif
                    examples/default/table_red_right.gif
                    lib/buttonize/button.rb
                    lib/buttonize/button_set.rb
                    lib/buttonize/cli.rb
                    lib/buttonize/style_set.rb
                    lib/buttonize.rb
                    MIT-LICENSE
                    README
                  )
  
  s.bindir = "bin"
  s.executables << "buttonize"
  s.require_paths = ["lib"]
  
  s.has_rdoc = false
  
  s.add_dependency "rmagick", [">= 2.5.1"]
  s.add_dependency "wycats-thor", ["~> 0.9.8"]
end
