module Events
  module Parsers
    class Delicious < Events::Parsers::Base

      def fields_from(raw_event)
        event = NormalizedEvent.new

        event.uuid = raw_event["u"]
        event.title = raw_event["d"]
        event.happened_at = raw_event["dt"]
        event.url = raw_event["u"]
        
        event
      end

    end
  end
end
