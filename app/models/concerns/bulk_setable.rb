module BulkSetable
  extend ActiveSupport::Concern

  def bulk_set
    if block_given?
      yield self
    end
  end
end
