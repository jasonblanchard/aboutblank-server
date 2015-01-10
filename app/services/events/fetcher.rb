module Events
  class Fetcher

    def initialize(client, parser, event_class)
      @client = client
      @parser = parser
      @event_class = event_class
    end

    def fetch_and_save!
      events.each do |event_data|
        save event_data
      end
    end

    def events
      @parser.normalized_events
    end

    def save(event_data)
      new_event = @event_class.where(:uuid => event_data.uuid).first_or_initialize

      new_event.bulk_set do |e|
        e.title = event_data.title
        e.happened_at = event_data.happened_at
        e.url = event_data.url
        e.image_url = event_data.image_url
      end

      new_event.save!
      new_event
    end

  end
end
