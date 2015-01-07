module Fetchers
  class BaseFetcher

    def initialize
      setup_client
      setup_parser
    end

    def setup_parser(parser=nil)
      raise NotImplemented
    end

    def setup_client(client=nil)
      raise NotImplemented
    end

    def fetch_and_save!
      events.each do |event|
        save event
      end
    end

    def events
      raise NotImplemented
    end

    def save
      raise NotImplemented
    end

  end
end
