# TODO: Move some of this stuff into the parent class
module Fetchers
  module Events
    class GoodreadsEventsFetcher < Fetchers::BaseFetcher

      def setup_client(client=nil)
        @client = client || Clients::Events::GoodreadsEventsClient.new
      end

      def setup_parser(parser=nil)
        @parser = parser || Parsers::Events::GoodreadsEventsParser
      end

      def events
        @client.events
      end

      def save(event)

        event_data = @parser.new(event).fields
        new_event = GoodreadsEvent.where(:uuid => event_data.uuid).first_or_initialize

        new_event.bulk_set do |e|
          e.title = event_data.title
          e.happened_at = event_data.happened_at
          e.url = event_data.url
          e.image_url = event_data.image_url
        end

        new_event.save
        new_event
      end

    end
  end
end
