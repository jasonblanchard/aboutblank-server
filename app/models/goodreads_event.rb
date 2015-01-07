class GoodreadsEvent < ActiveRecord::Base
  include EventValidatable
  include BulkSetable
end
