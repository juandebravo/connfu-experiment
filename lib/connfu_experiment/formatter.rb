require 'json'

module ConnfuExperiment
  class Formatter
    class << self
      
      def format(chunk)
        chunk = chunk.split "\n"

        if chunk.is_a?(Array)
          events = []
          chunk.each do |message|
            message = JSON.parse message
            if message.is_a?(Array)
              events << format_sms(message)
            else
              events << format_rss(message)
            end
          end
          events.flatten
        else
          puts "invalid data"
        end
      end

      private
        def format_rss(msg)
          {
            :id           => msg["object"]["id"],
            :content      => msg["title"],
            :message_type => "new",
            :type         => :rss,
            :channel_name => msg["backchat"]["bare_uri"],
            :from         => msg["actor"]["id"],
            :to           => []
          }          
        end

        def format_sms(msg)
           {
             :id           => 1234,
             :content      => msg[1]["message"],
             :from         => msg[1]["from"],
             :to           => msg[1]["to"],
             :type         => :sms,
             :channel_type => "voice",
             :channel_name => "sms"
            }
        end

    end
  end
end