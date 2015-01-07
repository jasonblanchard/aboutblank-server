module Fetcher
  class BaseFetcher

    def initialize
      # Override in subclass with an API client
      @client = Object.new
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
