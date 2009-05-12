require 'thor'

module Buttonize
  EXAMPLE_STYLE_FILE = File.join(File.dirname(__FILE__),"../../examples/default/styles.rb")

  class CLI < Thor
  
    desc "generate BUTTONSET", "Generates a whole bunch of buttons from a ButtonSet file"
    method_options :target_path => :optional, # The target where to put the generated buttons, defaults to PWD + "buttons"
                   :style_file => :optional, # The styleset file to load. Defaults to default built-in styles
                   :style_set => :optional # The styleset to use. Defaults to "default"
    def generate(buttonset)
      options = self.options.inject({}){|mem,h| mem[h[0].to_sym] = h[1]; mem}
        
      target_path = options[:target_path]
      if !target_path
        target_path = File.join(Dir.pwd,"buttons")
        FileUtils.mkdir_p(target_path) if !File.directory?(target_path)
      end
    
      options[:target_path] ||= target_path
    
      Buttonize.run_in_cli!
        
      # Load the buttonset
      require buttonset    
      raise "Are you sure #{buttonset} is a buttonset file?" if !ButtonSet.current
      
      if !ButtonSet.current.options[:style_file]
        require EXAMPLE_STYLE_FILE
      end
      
      puts "Generating buttons...."
      ButtonSet.current.send(:generate_buttons,options)
    end
  
    desc "button TEXT [OUTFILE]", "Generates a single button with TEXT on it, it sanitizes the text to generate filename"
    method_options :style_file => :optional, # The styleset file to load. Defaults to default built-in styles
                   :style_set => :optional, # The styleset to use. Defaults to "default"
                   :style => :required # The button style to use.
    def button(text,outfile=nil)
      options = {"style_file" => EXAMPLE_STYLE_FILE, "style_set" => :default}.update(self.options)
      style = get_style(options["style_file"],options["style_set"],options["style"])
      Buttonize::Button.new(style).generate(text,outfile)
    end
  
    protected
  
    def get_style(file,set,style)
      style_options = get_styleset(file,set).styles[style.to_sym] 
      raise "No such style '#{style}' defined in styleset '#{set}'" if style_options.nil?
      style_options
    end
  
    def get_styleset(file,set)
      require file
      set = Buttonize::StyleSet.sets[set.to_sym]
      raise "No such styleset '#{set}' defined in '#{file}'" if set.nil?
      set
    end
  
  end
end