require 'rails_helper'

RSpec.describe Fetchers::EventsFetcher do
  
  let(:client) { double('client') }
  let(:client) { Clients::Events::GoodreadsEventsClient }
  let(:parser) { Parsers::Events::GoodreadsEventsParser }
  let(:fetcher) { Fetchers::EventsFetcher.new(client, parser, GoodreadsEvent) }

  before do
    allow_any_instance_of(parser).to receive(:normalized_events).and_return([
      instance_double("BaseParser::NormalizedEvent", :uuid => '1234', :title => 'testing', :happened_at => Time.now.to_date, :url => "http://example.com", :image_url => "http://example.com/image"),
      instance_double("BaseParser::NormalizedEvent", :uuid => '4567', :title => 'testing2', :happened_at => Time.now.to_date, :url => "http://example.com/2", :image_url => "http://example.com/image/2"),
    ])
  end

  describe '#save' do
    describe 'when the event does not exist' do
      it 'creates a new event' do
        data = parser.new(client.events).normalized_events.first
        
        new_event = fetcher.save(data)
        expect(new_event.title).to eq data.title
        expect(new_event.happened_at).to eq data.happened_at
        expect(new_event.url).to eq data.url
        expect(new_event.uuid).to eq data.uuid
        expect(new_event.image_url).to eq data.image_url
        expect(GoodreadsEvent.count).to eq 1
      end
    end

    describe 'when the event already exists' do

      let!(:existing_event) { FactoryGirl.create(:goodreads_event, :uuid => '1234', :title => 'changeme') }

      it 'updates the event' do
        old_title = GoodreadsEvent.where(:uuid => '1234').first.title
        data = parser.new(client.events).normalized_events.first

        new_event = fetcher.save(data)
        new_title = GoodreadsEvent.where(:uuid => '1234').first.title

        expect(new_title).to_not eq old_title
        expect(GoodreadsEvent.count).to eq 1

      end
    end
  end

  describe '#events' do
    it 'delegates to @client.events' do
      expect(fetcher.events).to eq parser.new(client.events).normalized_events
    end
  end

  describe '#fetch_and_save!' do
    it 'saves events in bulk' do
      expect {fetcher.fetch_and_save!}.to change{GoodreadsEvent.count}.from(0).to(2)
    end
  end

end
