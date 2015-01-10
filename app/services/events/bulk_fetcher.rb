module Events
  class BulkFetcher

    SERVICES = ["Goodreads", "Delicious"]

    BUNDLES = SERVICES.map do |service|
      client = "Events::Clients::#{service}".constantize.new
      parser = "Events::Parsers::#{service}".constantize.new(client)
      event_class = "#{service}Event".constantize
      OpenStruct.new(:parser => parser, :event_class => event_class)
    end
    
    def self.fetch_and_save_all!
      BUNDLES.each do |bundle|
        Events::Fetcher.new(bundle.parser, bundle.event_class).fetch_and_save!
      end
    end

  end
end
