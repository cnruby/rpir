class ADC::MCP3008
  # attr_accessor :config

  def initialize(pi, channel)
    @pi = pi
    @channel = channel
    # set up the SPI interface pins
    @config = YAML.load_file Rpir::ROOT_CONFIG
    @config[Rpir::INPUT].each do |pin|
      @pi.mode(pin[1], INPUT)
      @pin_miso = pin[1] if pin[0] == PIN::MISO
    end
    @config[Rpir::OUTPUT].each do |pin|
      @pi.mode(pin[1], OUTPUT)
      case pin[0]
        when PIN::CLOCK
          @pin_clock = pin[1]
        when PIN::MOSI
          @pin_mosi = pin[1]
        when PIN::CS
          @pin_cs = pin[1]
      end
    end
  end

  # def config
  #   @config = YAML.load_file Rpir::ROOT_CONFIG
  # end

  # def config=(str)
  #   @config = str
  # end

  # read SPI data from MCP3008 chip, 8 possible adc's (0 thru 7)
  def read_adc()
    # temperature sensor connected 'channel' of mcp3008
    return -1 if ((@channel > 7) || (@channel < 0))
    @pi.write(@pin_cs,HIGH)

    @pi.write(@pin_clock,LOW) # start clock low
    @pi.write(@pin_cs,LOW)    # bring CS low

    commandout = @channel
    commandout |= 0x18  # start bit + single-ended bit
    commandout <<= 3    # we only need to send 5 bits here
    for i in 0...5
      if (commandout & 0x80) > 0
        @pi.write(@pin_mosi,HIGH)
      else   
        @pi.write(@pin_mosi,LOW)
      end
      commandout <<= 1
      @pi.write(@pin_clock,HIGH)
      @pi.write(@pin_clock,LOW)
    end

    @adcout = 0
    # read in one empty bit, one null bit and 10 ADC bits
    for i in 0...12
      @pi.write(@pin_clock,HIGH)
      @pi.write(@pin_clock,LOW)
      @adcout <<= 1
      @adcout |= 0x1 if @pi.read(@pin_miso) == HIGH
    end
    [@adcout /= 2, Time.now]       # first bit is 'null' so drop it
  end
end