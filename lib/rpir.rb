require "rpir/version"
require 'yaml'

module Rpir
  ROOT_RPIR   = Dir.pwd
  ROOT_CONFIG = ROOT_RPIR + '/config.yml'  
  T = {
    :MCP3008  => :ADC,
    :TMP36    => :TEMPERATURE,
    :LM35     => :TEMPERATURE
    }
  OUTPUT      = 'output'
  INPUT       = 'input'
end

module PIN
  MISO  = 'pinmiso'
  CLOCK = 'pinclock'
  MOSI  = 'pinmosi'
  CS    = 'pincs'
end

module ADC
  class MCP3008
  end
end

require "adc/mcp3008"
require "temperature/temperature"
require "temperature/lm35"
require "temperature/tmp36"