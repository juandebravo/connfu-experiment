module ConnfuExperiment
  class DSL
    class << self

      def run
        if block_given?
          self.instance_exec &Proc.new
        end
      end

      def listen(name)
        if block_given?
          callbacks[name].push(Proc.new)
        end
      end

      def callbacks
        @callbacks ||= Hash.new {|hash, key| hash[key.to_sym] = []}
      end
      
    end
  end
end