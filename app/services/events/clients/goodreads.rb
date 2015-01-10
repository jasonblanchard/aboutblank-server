module Events
  module Clients
    class Goodreads

      def events
        ::Goodreads::Client.new.shelf(3734291, 'currently-reading')[:books]
      end

    end
  end
end
