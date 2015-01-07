require 'rails_helper'

RSpec.describe DeliciousEvent, :type => :model do
  it_behaves_like "an event", DeliciousEvent
end
