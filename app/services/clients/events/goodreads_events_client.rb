module Clients
  module Events
    class GoodreadsEventsClient

      def self.events
        Goodreads::Client.new.shelf(3734291, 'currently-reading')[:books]
      end

    end
  end
end
