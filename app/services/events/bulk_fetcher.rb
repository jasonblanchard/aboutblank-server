module Events
  class BulkFetcher
    
    BUNDLES = [
      OpenStruct.new(:parser => Events::Parsers::Goodreads.new(Events::Clients::Goodreads.new), :event_class => GoodreadsEvent),
      OpenStruct.new(:parser => Events::Parsers::Delicious.new(Events::Clients::Delicious.new), :event_class => DeliciousEvent)
    ]

    def self.fetch_and_save_all!
      BUNDLES.each do |bundle|
        Events::Fetcher.new(bundle.parser, bundle.event_class).fetch_and_save!
      end
    end

  end
end
