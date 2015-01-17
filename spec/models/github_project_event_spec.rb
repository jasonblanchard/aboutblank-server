require 'rails_helper'

RSpec.describe GithubProjectEvent, :type => :model do
  it_behaves_like "an event", DeliciousEvent
end
