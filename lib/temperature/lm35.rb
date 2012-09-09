require 'temperature/temperature'

class LM35 < Temperature
  def initialize(a2d, pi, channel)
    super
    @millivolts = adc * ( @volt * 1000.0 / 1024.0 )
    @celsius = millivolts / 10
  end
end