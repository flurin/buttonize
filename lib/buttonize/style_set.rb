class Buttonize::StyleSet
  
  class Style < Hash
    def method_missing(meth,*params)
      if meth.to_s =~ /=$/
        self[meth.to_s.sub(/=$/,"").to_sym] = params.first
      elsif self.has_key?(meth)
        self[meth]
      else 
        super(meth,*params)
      end
    end    
  end
  
  class << self
    def define(*opts,&block)
      options = {}
      options = opts.pop if opts.last.kind_of?(Hash)
      name = opts.pop if opts.last.kind_of?(String)
      name ||= :default
      set = self.sets[name] = self.new(name,options)
      yield set
      set
    end

    def sets
      @@sets ||= {}
    end
  end 

  attr_reader :name, :styles, :options

  def initialize(name,options={})
    @name = name
    @styles = {}
    @options = options
  end
   
  def style(name,options={})
    style = Style.new
    
    style.update(self.options)
    if base = options.delete(:based_on)
      style.update(self.styles[base]) 
    end
    style.update(options)
     
    yield(style) if block_given?
    
    self.styles[name] = style
  end
   
   
end