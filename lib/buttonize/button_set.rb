module Buttonize
  class ButtonSet
  
    class << self
      # Define a buttonset
      #
      # ==== Options
      # :style_file:: The style definition file to load
      # :style_set:: The styleset to use, defaults to :default
      # :target_path:: The output directory
      # --
      def define(options={},&block)
        @@set = self.new(options)
        yield @@set
        @@set
      end
    
      def current
        @@set
      end
    end 

    attr_reader :groups, :buttons, :options
    attr_accessor :path
  
    def initialize(options)
      defaults = {:style_set => :default}
      @options = defaults.update(options)
      @buttons = []
      @groups = []
      @path = ""
      @parent = nil
    end
    
    def group(name,options={})
      group = self.class.new({}.update(self.options).update(options))
      group.path = File.join(self.path,name)
      yield group
      @groups << group
      group
    end
  
    def button(text,*opts)
      button = {:text => text, :options => {}}
      button[:options] = opts.pop if opts.last.kind_of?(Hash)
      button[:filename] = opts.pop if opts.last.kind_of?(String)
      @buttons << button
      button
    end
  
    # Generate all buttons recursively,
    # all options set in define can be overruled here.
    # --
    def generate(options)
      # Don't run this when we're in cli mode
      return if Buttonize.cli?
      generate_buttons(options)
    end
  
    protected

    def generate_buttons(options)
      current_options = self.options.merge(options)
  
      require current_options[:style_file] if current_options[:style_file]
      styleset = Buttonize::StyleSet.sets[current_options[:style_set]]
  
      # 1. Generate my own buttons
      self.buttons.each do |button|
        button_options = button[:options].dup
    
        # Determine target path
        button_options[:target_path] = File.join(current_options[:target_path],self.path) unless button_options[:target_path]
    
        # Merge with group options
        button_options = current_options.merge(button_options)

        # Merge with style options
        style_name = button_options.delete(:style)
        button_options = styleset.styles[style_name].merge(button_options) if styleset.styles.has_key?(style_name)
    
        Button.new(button_options).generate(button[:text],button[:filename])
      end
  
      # 2. Generate buttons of my groups
      self.groups.each do |group| 
        # Create target path
        if File.directory?(current_options[:target_path]) && !File.directory?(File.join(current_options[:target_path],group.path))
          FileUtils.mkdir_p(File.join(current_options[:target_path],group.path))
        end
    
        # Generate buttons
        group.send(:generate_buttons,options)
      end      
    end
    
  end
end