module Events
  module Clients
    class Delicious

      def events
        r = HTTParty.get('http://feeds.delicious.com/v2/json/jasonblanchard')
        r.parsed_response
      end

    end
  end
end
