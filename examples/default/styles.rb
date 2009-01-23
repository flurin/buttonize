Buttonize::StyleSet.define(:template_path => File.dirname(__FILE__)) do |set|
  set.style(:big_blue) do |s|
    s.font_size = 10
    s.template_base = "big_blue"
    s.paddings = [20,20]
  end

  set.style(:big_orange, :based_on => :big_blue, :template_base => "big_orange")
  set.style(:big_red, :based_on => :big_blue, :template_base => "big_red")
  set.style(:big_green, :based_on => :big_blue, :template_base => "big_green")

  set.style(:small_blue, :font_size => 9, :template_base => "small_blue", :width => 65)
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