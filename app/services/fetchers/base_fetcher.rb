module Fetchers
  class BaseFetcher

    def initialize
      setup_client
      setup_parser
      setup_event_class
    end

    def setup_event_class(klass=nil)
      raise NotImplemented.new
    end

    def setup_parser(parser=nil)
      raise NotImplemented.new
    end

    def setup_client(client=nil)
      raise NotImplemented.new
    end

    def fetch_and_save!
      events.each do |event|
        save event
      end
    end

    def events
      @client.events
    end

    def save(event)

      event_data = @parser.new(event).fields
      new_event = @event_class.where(:uuid => event_data.uuid).first_or_initialize

      new_event.bulk_set do |e|
        e.title = event_data.title
        e.happened_at = event_data.happened_at
        e.url = event_data.url
        e.image_url = event_data.image_url
      end

      new_event.save
      new_event
    end

  end
end
