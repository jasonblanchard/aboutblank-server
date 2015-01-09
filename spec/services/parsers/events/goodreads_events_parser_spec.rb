require 'rails_helper'

RSpec.describe Parsers::Events::GoodreadsEventsParser do
  describe '#normalized_events' do
    it 'returns normalized fields' do
      data = [
        {
          :book => {:title => 'testing', :link => "http://example.com", :small_image_url => "http://example.com/image"},
          :started_at => Time.now.to_date,
          :id => '1234'
        },
        {
          :book => {:title => 'testing2', :link => "http://example.com/2", :small_image_url => "http://example.com/image/2"},
          :started_at => Time.now.to_date,
          :id => '5678'
        },
      ]

      output = Parsers::Events::GoodreadsEventsParser.new(data).normalized_events.first

      event1 = data[0]

      expect(output.uuid).to eq event1[:id]
      expect(output.title).to eq event1[:book][:title]
      expect(output.happened_at).to eq event1[:started_at]
      expect(output.url).to eq event1[:book][:link]
      expect(output.image_url).to eq event1[:book][:small_image_url]
    end
  end
end
