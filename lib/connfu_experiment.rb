require "connfu_experiment/version"
require 'rubygems'
require 'em-http-request'

module ConnfuExperiment
  ENDPOINT = "https://stream.connfu.com/connfu-stream-testing-emc2"

  autoload :Listener  , 'connfu_experiment/listener'
  autoload :Formatter , 'connfu_experiment/formatter'
  autoload :Dispatcher, 'connfu_experiment/dispatcher'

  class << self
    def start api_key
      Listener.new ENDPOINT, api_key do |msj|
        print msj
      end
    end
  end
end