require File.dirname(__FILE__) + "/../lib/buttonize"

buttons = Buttonize::ButtonSet.define(:style_file => File.dirname(__FILE__) + "/default/styles.rb", :style_set => :default) do |set|
  
  set.button "Test", :style => :small_green
  
  set.group("big",:style => :big_green) do |s|
    s.button "Confirm"
    s.button "Export", "export"
    s.button "Import", "import", :width => 65
  end

  set.group("big",:style => :big_blue) do |s|
    s.button "Continue"
  end

  set.group("small", :style => :small_red) do |s|
    s.button "Unsubscribe"
  end
end

buttons.generate(:target_path => "/Users/flurin/temp/button_out")