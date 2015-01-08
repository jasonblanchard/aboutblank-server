module Fetchers
  module Events
    class GoodreadsEventsFetcher < Fetchers::BaseFetcher

      def setup_client(client=nil)
        @client = client || Clients::Events::GoodreadsEventsClient.new
      end

      def setup_parser(parser=nil)
        @parser = parser || Parsers::Events::GoodreadsEventsParser
      end

      def setup_event_class(klass=nil)
        @event_class = klass || GoodreadsEvent
      end

    end
  end
end
