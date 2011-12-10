module ConnfuExperiment
  class Listener

    def initialize(endpoint, api_key)
      @endpoint = endpoint
      @api_key = api_key
    end

    def run
      EventMachine.run do
        http = EventMachine::HttpRequest.new(@endpoint).get :keepalive => true, :head => headers
        data = ""

        http.stream do |chunk|
          data << chunk
          if data =~ /\n\Z$/
            dispatcher.handle Formatter.format chunk
            data = ""
          end
        end
      end
    end

    def headers
      @headers ||= {"authorization" => "Backchat #{@api_key}"}
    end

    def dispatcher
      @dispatcher ||= Dispatcher
    end
  end
end