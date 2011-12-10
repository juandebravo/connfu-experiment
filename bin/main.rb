$:.unshift("./lib")

require 'connfu_experiment'

ConnfuExperiment.start ARGV[0] do
  
  listen "sms" do |msj|
    puts msj.content
  end

  listen "rss" do |rss|
    puts rss.content
  end

end