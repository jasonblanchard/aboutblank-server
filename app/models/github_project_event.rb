class GithubProjectEvent < ActiveRecord::Base
  include EventValidatable
  include BulkSetable
end
