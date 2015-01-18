class GithubStarEvent < ActiveRecord::Base
  include EventValidatable
  include BulkSetable
end
