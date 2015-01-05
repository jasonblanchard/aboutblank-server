require 'rails_helper'

RSpec.describe GoodreadsEvent, :type => :model do
  it_behaves_like "an event", GoodreadsEvent
end
