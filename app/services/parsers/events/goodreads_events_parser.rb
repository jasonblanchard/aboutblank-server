module Parsers
  module Events
    class GoodreadsEventsParser < Parsers::BaseParser

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
