require 'rubygems'
require 'rmagick'
include Magick
require 'fileutils'
include FileUtils

module Buttonize
  def run_in_cli!
    @run_in_cli = true
  end
  
  def cli?
    @run_in_cli
  end
  
  module_function :run_in_cli!, :cli?
end

require File.dirname(__FILE__) + "/buttonize/button"
require File.dirname(__FILE__) + "/buttonize/style_set"
require File.dirname(__FILE__) + "/buttonize/button_set"

