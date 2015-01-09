module Parsers
  module Events
    class GoodreadsEventsParser < Parsers::BaseParser

      def fields_from(raw_event)
        event = NormalizedEvent.new

        event.uuid = raw_event[:id]
        event.title = raw_event[:book][:title]
        event.happened_at = raw_event[:started_at]
        event.url = raw_event[:book][:link]
        event.image_url = raw_event[:book][:small_image_url]
        
        event
      end

    end
  end
end
