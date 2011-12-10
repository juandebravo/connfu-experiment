module ConnfuExperiment
  class Dispatcher
    class << self
      
      def handle(message)
        message = Array(message)

        message.each do |msj|
          _blocks = Array(callbacks[msj[:type]])
          _blocks.each { |b| b.call msj }
        end
      end

      def callbacks
        @callbacks ||= { :sms => lambda{|message| puts message[:content]},
                         :rss => lambda{|message| puts message[:content]}}
      end

    end
  end
end