module Events
  module Parsers
    class GithubProject < Events::Parsers::Base

      def fields_from(raw_event)
        event = NormalizedEvent.new

        event.uuid = raw_event.id
        event.title = raw_event.full_name
        event.happened_at = raw_event.created_at
        event.url = raw_event.url

        event
      end
    end
  end
end
