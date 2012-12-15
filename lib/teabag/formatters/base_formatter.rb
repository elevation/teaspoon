module Teabag
  module Formatters

    autoload :ProgressFormatter,      'teabag/formatters/progress_formatter'
    autoload :SwayzeOrOprahFormatter, 'teabag/formatters/swayze_or_oprah_formatter'

    class BaseFormatter

      attr_accessor :total, :passes, :pendings, :failures, :errors

      def initialize
        @total    = 0
        @passes   = []
        @pendings = []
        @failures = []
        @errors   = []
      end

      def spec(result)
        @total += 1
        if result.passing?
          @passes << result
        elsif result.pending?
          @pendings << result
        else
          @failures << result
        end
      end

      # Exceptions come from startup errors in the server
      def exception(exception = {})
        raise Teabag::RunnerException
      end
    end
  end
end
