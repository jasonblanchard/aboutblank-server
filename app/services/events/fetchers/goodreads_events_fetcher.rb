module Events
  module Fetchers
    class GoodreadsEventsFetcher

      def initialize
        @client = Goodreads::Client.new
      end

      def fetch
        @events = @client.shelf(3734291, 'currently-reading')
      end

    end
  end
end
