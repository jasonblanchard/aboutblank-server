require 'rails_helper'

RSpec.describe GithubStarEvent, :type => :model do
  it_behaves_like "an event", DeliciousEvent
end
