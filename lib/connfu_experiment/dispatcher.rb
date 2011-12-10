module ConnfuExperiment
  class Dispatcher
    class << self
      
      def handle(message)
        message = Array(message)

        message.each do |msj|
          _blocks = Array(DSL.callbacks[msj[:type]])
          _blocks.each { |b| b.call msj }
        end
      end

    end
  end
end