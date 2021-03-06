module Events
  module Parsers
    class Base

      class NormalizedEvent
        attr_accessor :uuid, :title, :happened_at, :url, :image_url
      end

      def initialize(client)
        @client = client
      end

      def data
        @client.events
      end

      def normalized_events
        data.map do |raw_event|
          fields_from(raw_event)
        end
      end

      def fields_from(raw_event)
        raise NotImplementedError.new
      end
    end
  end
end
