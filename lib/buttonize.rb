require 'rubygems'
require 'rmagick'
include Magick
require 'fileutils'
include FileUtils

module Buttonize
end

require File.dirname(__FILE__) + "/buttonize/button"
require File.dirname(__FILE__) + "/buttonize/style_set"
require File.dirname(__FILE__) + "/buttonize/button_set"

