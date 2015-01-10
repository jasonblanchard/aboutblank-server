require 'rails_helper'

RSpec.describe Events::Parsers::Delicious do

  let(:parser) { Events::Parsers::Delicious }
  let(:client) { Events::Clients::Delicious }
  let(:data) {[
    {"d" => "Cool new link", "u" => "http://www.example.com", "dt" => "2014-09-16T14:36:31Z"},
    {"d" => "Cool new link2", "u" => "http://www.example.com/1", "dt" => "2014-09-16T14:36:31Z"}
  ]
  }

  before do
    allow_any_instance_of(client).to receive(:events).and_return(data)
  end

  describe '#normalized_events' do
    it 'returns normalized fields' do
      output = parser.new(client.new).normalized_events.first

      event1 = data[0]

      expect(output.uuid).to eq event1["u"]
      expect(output.title).to eq event1["d"]
      expect(output.happened_at.to_date).to eq event1["dt"].to_date
      expect(output.url).to eq event1["u"]
      expect(output.image_url).to eq nil
    end
  end
end
