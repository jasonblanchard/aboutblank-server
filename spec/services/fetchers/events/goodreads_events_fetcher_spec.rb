require 'rails_helper'

RSpec.describe Fetchers::Events::GoodreadsEventsFetcher do
  
  let(:client) { double('client') }
  let(:fetcher) { Fetchers::Events::GoodreadsEventsFetcher.new }

  before do
    allow(client).to receive(:events).and_return([{
      :book => {:title => 'testing', :link => "http://example.com", :small_image_url => "http://example.com/image"},
      :started_at => Time.now.to_date,
      :id => '1234'
    }])
  end

  describe '#setup_client' do
    it 'sets the client to a default' do
      client = fetcher.setup_client
      expect(client).to be_a Clients::Events::GoodreadsEventsClient
    end
  end

  describe '#save' do
    describe 'when the event does not exist' do
      it 'creates a new event' do
        data = client.events.first
        new_event = fetcher.save(data)
        expect(new_event.title).to eq data[:book][:title]
        expect(new_event.happened_at).to eq data[:started_at]
        expect(new_event.url).to eq data[:book][:link]
        expect(new_event.uuid).to eq data[:id]
        expect(new_event.image_url).to eq data[:book][:small_image_url]
        expect(GoodreadsEvent.count).to eq 1
      end
    end

    describe 'when the event already exists' do
      let!(:existing_event) { FactoryGirl.create(:goodreads_event, :uuid => '1234', :title => 'changeme') }

      it 'updates it and does not duplicate it' do
        old_title = GoodreadsEvent.where(:uuid => '1234').first.title
        data = client.events.first
        new_event = fetcher.save(data)
        new_title = GoodreadsEvent.where(:uuid => '1234').first.title

        expect(new_title).to_not eq old_title
        expect(GoodreadsEvent.count).to eq 1

      end
    end
  end
end
