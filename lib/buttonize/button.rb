class Buttonize::Button
  
  attr_reader :options
  
  def initialize(options)
    @options = {
      :paddings => [10,10], 
      :width => nil, 
      :template_base => "button",
      :template_path => File.dirname(__FILE__) + "/../../examples/default",        
      :font => "Arial",#File.dirname(__FILE__) + "/fonts/verdanab.ttf", 
      :font_size => 9,       
      :font_antialias => true, 
      :text_offset => {:x => 0, :y => 0},
      :text_align => :center,
      :target_path => Dir.pwd
    }.update(options)
    @options[:template_images] ||=  ["_left","_middle","_right"].map{|p| options[:template_base] + p + ".gif" }
    
    # Validation
    @options[:template_images].each{|i| raise "Missing template_image #{i}" unless File.exist?(File.join(options[:template_path],i)) }
  end
  
  def log(text)
    puts text
  end
  
  def generate(text, filename = nil)
    filename ||= self.text_to_filename(text)
    filename = add_extension(filename,"gif")
    paddings = options[:paddings]

    # Load the images
    left,mid,right = options[:template_images].map{|p| Image.read(File.join(options[:template_path],p)).first }  

    draw = Draw.new
    draw.pointsize = options[:font_size]
    draw.fill = "#fff"
    draw.gravity = self.gravity_from_alignment(options[:text_align])
    draw.font = options[:font]
    draw.font_weight = Magick::AnyWeight
    draw.text_antialias = options[:font_antialias] || false
    
    # Measure the text first
    metrics = draw.get_type_metrics(text)
    target_width = metrics.width + paddings[0] + paddings[1]

    target_width = options[:width] if options[:width] && options[:width] > target_width

    self.log "Generating image with text \"#{text}\" and width #{target_width}px and height #{left.rows}px"
    dst = Image.new(target_width,left.rows) { self.background_color = "transparent"}

    # Place left
    dst.composite!(left,0,0,Magick::OverCompositeOp)

    # Fill up the middle
    pos = left.columns
    while pos < (target_width - right.columns) do
      if pos + mid.columns >= (target_width - right.columns)
        leftover = target_width - pos - right.columns
        dst.composite!(mid,(pos - (mid.columns - leftover)),0,Magick::OverCompositeOp)
        pos = pos - (mid.columns - leftover) +  mid.columns
      else
        dst.composite!(mid,pos,0,Magick::OverCompositeOp)
        pos += mid.columns  
      end

    end

    # Place right
    dst.composite!(right,pos,0,Magick::OverCompositeOp)
    draw.annotate(dst,0,0,options[:text_offset][:x],options[:text_offset][:y],text)
    dst.write(File.join(options[:target_path],filename))
    dst.destroy!
    
    filename      
  end

  def text_to_filename(text)
    text.to_s.downcase.gsub(/[^a-z0-9]/,"_").squeeze("_").gsub(/_$/,"") 
  end
  
  def add_extension(filename,extension)
    if filename =~ /\.#{extension}$/
      filename
    else
      filename + "." + extension
    end
  end
  
  def gravity_from_alignment(alignment)
    case alignment
    when :left then Magick::WestGravity
    when :right then Magick::EastGravity
    else Magick::CenterGravity      
    end
  end
  
end