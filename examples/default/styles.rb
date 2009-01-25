Buttonize::StyleSet.define(:template_path => File.dirname(__FILE__)) do |set|
  
  # Style definition with a block
  set.style(:big_blue) do |s|
    # The name of the template image files the images will be searched for
    # in s.template_path and will be suffixed with "_left.gif", "_right.gif", "_middle.gif"
    # (default = button)
    s.template_base = "big_blue"
    
    # Alternatively you can use template_images to specify the left/middle/right images
    # with paths relative to the template_path.
    # s.template_images = ["big_blue_left.gif","big_blue_middle.gif","big_blue_right.gif"]

    # The font to use (can be all fonts RMagick can use), (default = Arial)
    s.font = File.join(File.dirname(__FILE__),"fonts","Vera.ttf")
    # Size of the font to use in pt (default = 9)
    s.font_size = 10
    # Antialias the font when rendering (default = true)
    s.font_antialias = true
    
    # The color of the textrendering, can be anything RMagick sees as
    # a color. (default = #fff)
    s.text_color = "#fff"
    # The text alignment within the final button, can be any of
    # :left, :right or :center (default = :center)
    s.text_align = :center
    # The x and y offset the text should be rendered with. This
    # is in relation to the alignment set and can be used to finetune the optical
    # text placement.
    s.text_offset = {:x => 0, :y => 0}
    
    
    # If width is set (not nil) Buttonize will try to create a button of 
    # the specified width, if the text will however not fit (including paddings)
    # Buttonize falls back on rendering the text with the specified paddings (see below)
    # (default = nil)
    s.width = nil
    # The padding to give the text to the left and right side of the button
    # specified in an array of [left_padding,right_padding] in pixels. If width
    # is set and the text width + padding fits into the width, these paddings
    # will be ignored. (default = {:left => 10, :right => 10})
    s.padding = {:left => 20, :right => 20}
    
  end

  set.style(:big_orange, :based_on => :big_blue, :template_base => "big_orange")
  set.style(:big_red, :based_on => :big_blue, :template_base => "big_red")
  set.style(:big_green, :based_on => :big_blue, :template_base => "big_green")
  
  # Inline style definition with a Hash
  set.style(:small_blue, :font => File.join(File.dirname(__FILE__),"fonts","Vera.ttf"), :font_size => 9, :template_base => "small_blue", :width => 65)
  set.style(:small_orange, :based_on => :small_blue, :template_base => "small_orange")
  set.style(:small_red, :based_on => :small_blue, :template_base => "small_red")
  set.style(:small_green, :based_on => :small_blue, :template_base => "small_green")
  
end
 
# Styles = {   
#   :table_blue => {:fontsize => 8, :base => "table_blue", :paddings => [5,5], :font => File.dirname(__FILE__) + "/fonts/slkscrb.ttf", :antialias => false},
#   :table_orange => {:fontsize => 8, :base => "table_orange", :paddings => [5,5], :font => File.dirname(__FILE__) + "/fonts/slkscrb.ttf", :antialias => false},
#   :table_red => {:fontsize => 8, :base => "table_red", :paddings => [5,5], :font => File.dirname(__FILE__) + "/fonts/slkscrb.ttf", :antialias => false},
#   :table_green => {:fontsize => 8, :base => "table_green", :paddings => [5,5], :font => File.dirname(__FILE__) + "/fonts/slkscrb.ttf", :antialias => false}
# }