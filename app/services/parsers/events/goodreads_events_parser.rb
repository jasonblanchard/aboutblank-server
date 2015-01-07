# TODO make parent class
# TODO Write tests
module Parsers
  module Events
    class GoodreadsEventsParser

      attr_reader :uuid, :title, :happened_at, :url, :image_url

      def initialize(data)
        @data = data
      end

      def fields
        @uuid = @data[:id]
        @title = @data[:book][:title]
        @happened_at = @data[:started_at]
        @url = @data[:book][:link]
        @image_url = @data[:book][:small_image_url]

        self
      end

    end
  end
end
