require 'adc/mcp3008'

class Temperature
  def initialize(a2d, pi, channel)
    @channel = channel
    config = YAML.load_file Rpir::ROOT_CONFIG
    @volt = config['volt']
    @adc, @time = eval("#{Rpir::T[a2d]}::#{a2d}")
      .new(pi,channel)
      .read_adc()
  end
  
  def time
    @time
  end
  
  def channel
    @channel
  end
  
  def adc
    @adc
  end
  
  def volt
    @volt
  end

  def millivolts
    @millivolts
  end

  def millivolts_to_s(dec=nil)
    "%.#{dec}f" % @millivolts unless dec.nil?
  end

  def celsius
    @celsius
  end

  def fahrenheit
    ( @celsius * 9.0 / 5.0 ) + 32
  end

  def celsius_to_s(dec=nil)
    "%.#{dec}f" % celsius unless dec.nil?
  end

  def fahrenheit_to_s(dec=nil)
    "%.#{dec}f" % fahrenheit unless dec.nil?
  end
end