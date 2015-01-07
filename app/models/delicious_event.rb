class DeliciousEvent < ActiveRecord::Base
  include EventValidatable
  include BulkSetable
end
