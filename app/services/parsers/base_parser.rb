module Parsers
  class BaseParser
    attr_reader :uuid, :title, :happened_at, :url, :image_url

    def initialize(data)
      @data = data
    end

    def fields
      raise NotImplementedError.new
    end
  end
end
