require 'temperature/temperature'

class TMP36 < Temperature
  def initialize(a2d, pi, channel)
    super
    @millivolts = @adc * ( @volt * 1000.0 / 1024.0 )
    @celsius = ((@millivolts - 100.0) / 10.0) - 40.0
  end
end