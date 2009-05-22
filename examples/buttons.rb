require File.dirname(__FILE__) + "/../lib/buttonize"
require 'pathname'
base = Pathname.new(File.dirname(__FILE__))

buttons = Buttonize::ButtonSet.define(:style_file => base + "default/styles.rb", :style_set => :default) do |set|
  
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

# This will not be ran if you use the buttonize commandline script
buttons.generate(:target_path => File.expand_path("~/temp/button_out"))