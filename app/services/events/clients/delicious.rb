module Events
  module Clients
    class Delicious

      def events
        r = HTTParty.get('http://feeds.delicious.com/v2/json/jas.blanchard')
        events = r.parsed_response

        if r.code == 200
          events
        else
          []
        end
      end

    end
  end
end
