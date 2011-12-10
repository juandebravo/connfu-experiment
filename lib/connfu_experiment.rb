require "connfu_experiment/version"
require 'rubygems'
require 'em-http-request'

module ConnfuExperiment
  ENDPOINT = "https://stream.connfu.com/connfu-stream-testing-emc2"

  autoload :Listener  , 'connfu_experiment/listener'
  autoload :Formatter , 'connfu_experiment/formatter'
  autoload :Dispatcher, 'connfu_experiment/dispatcher'
  autoload :DSL       , 'connfu_experiment/dsl'

  class << self
    def start api_key
      DSL.run &Proc.new
      Listener.new(ENDPOINT, api_key).run
    end
  end
end