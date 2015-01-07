module Fetcher
  module Event
    class GoodreadsEventsFetcher < Fetcher::BaseFetcher

      def initialize
        @client = Goodreads::Client.new
      end

      def events
        @events ||= @client.shelf(3734291, 'currently-reading')[:books]
      end

      def save(event)
        new_event = GoodreadsEvent.new

        new_event.bulk_set do |e|
          e.uuid = event[:id]
          e.happened_at = event[:started_at]
          e.image_url = event[:book][:small_image_url]
          e.url = event[:book][:link]
          e.title = event[:book][:title]
        end

        new_event.save
      end

    end
  end
end
