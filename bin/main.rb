$:.unshift("./lib")

require 'connfu_experiment'

ConnfuExperiment.start ARGV[0] do
  
  listen :sms do |msg|
    puts "Just got an SMS from #{msg[:from]} to #{msg[:to]}: #{msg[:content]}"
  end

  listen :rss do |rss|
    puts "Just got an RSS: #{rss[:content]}"
  end

end