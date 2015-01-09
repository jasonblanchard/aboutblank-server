module Parsers
  class BaseParser

    class BaseParser::NormalizedEvent
      attr_accessor :uuid, :title, :happened_at, :url, :image_url

    end

    def initialize(data)
      @data = data
    end

    def events
      @data.map do |raw_event|
        fields_from(raw_event)
      end
    end

    def fields_from(raw_event)
      raise NotImplementedError.new
    end
  end
end
