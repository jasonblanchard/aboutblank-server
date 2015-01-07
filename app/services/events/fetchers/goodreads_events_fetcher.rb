module Events
  module Fetchers
    class GoodreadsEventsFetcher

      def initialize
        @client = Goodreads::Client.new
      end

      def events
        @events ||= @client.shelf(3734291, 'currently-reading')[:books]
      end

      def fetch_and_save!
        events.each do |event|
          save event
        end
      end

      private

      def save(event)
        new_event = GoodreadsEvent.new

        new_event.uuid = event[:id]
        new_event.happened_at = event[:started_at]
        new_event.image_url = event[:book][:small_image_url]
        new_event.url = event[:book][:link]
        new_event.title = event[:book][:title]

        new_event.save
      end

    end
  end
end
