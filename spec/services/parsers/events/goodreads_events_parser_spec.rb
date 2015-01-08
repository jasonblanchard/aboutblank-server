require 'rails_helper'

RSpec.describe Parsers::Events::GoodreadsEventsParser do
  describe '#fields' do
    it 'returns normalized fields' do
      data = {
        :book => {:title => 'testing', :link => "http://example.com", :small_image_url => "http://example.com/image"},
        :started_at => Time.now.to_date,
        :id => '1234'
      }

      output = Parsers::Events::GoodreadsEventsParser.new(data).fields

      expect(output.uuid).to eq data[:id]
      expect(output.title).to eq data[:book][:title]
      expect(output.happened_at).to eq data[:started_at]
      expect(output.url).to eq data[:book][:link]
      expect(output.image_url).to eq data[:book][:small_image_url]
    end
  end
end
