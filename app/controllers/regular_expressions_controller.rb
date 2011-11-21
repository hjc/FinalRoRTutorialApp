class RegularExpressionsController < ApplicationController
  
  def show
    @title = "Regular Expression Tester"
  end
  
  def test
  end
  
  def proc
    @body = params[:body]
    @opts = params[:opts]
    @string = params[:string]
    case @opts
    when 'i'
      hold = /#{@body}/i
    when 'm'
      hold = /#{@body}/m
    when 'x'
      hold = /#{@body}/x
    when 'o'
      hold = /#{@body}/o
    when 'im', 'mi'
      hold = /#{@body}/im
    when 'ix', 'xi'
      hold = /#{@body}/ix
    when 'io', 'oi'
      hold = /#{@body}/io
    when 'mx', 'xm'
      hold = /#{@body}/mx
    when 'mo', 'om'
      hold = /#{@body}/mo
    when 'xo', 'ox'
      hold = /#{@body}/xo
    when !@opts.scan('i').nil? && !@opts.scan('m').nil? && !@opts.scan('x').nil?
      hold = /#{@body}/imx
    when !@opts.scan('i').nil? && !@opts.scan('m').nil? && !@opts.scan('o').nil?
      hold = /#{@body}/imo
    when !@opts.scan('i').nil? && !@opts.scan('x').nil? && !@opts.scan('o').nil?
      hold = /#{@body}/ixo
    when !@opts.scan('m').nil? && !@opts.scan('m').nil? && !@opts.scan('o').nil?
      hold = /#{@body}/xmo
    when !@opts.scan('i').nil? && !@opts.scan('m').nil? && !@opts.scan('o').nil? \
      && !@opts.scan('x').nil?
      hold = /#{@body}/imo
    else
      @opts = ""
      hold = /#{@body}/
    end
    #hold = /#{@body}/
    re = hold
    @results = @string.scan(re)
    if @results.empty?
      @results = "Failed to Match"
    end
    #@results = re.to_s
    
    render 'show'
  end
end
