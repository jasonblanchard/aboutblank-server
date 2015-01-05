RSpec.shared_examples "an event" do |klass|

  it "can be created" do
    event = klass.new
    event.save
    expect(event).to be_a klass
  end

  it "has all the fields" do
    event = klass.new
    fields = [:uuid, :happened_at, :image_url, :url, :title]

    fields.each do |field|
      expect{event.send(field)}.not_to raise_error
    end
  end

  describe "validations" do
    it "validates presence of :uuid" do
      event = klass.new
      event.save
      expect(event.valid?).to eq false
    end

    it "validates uniqueness of :uuid" do
      event1 = klass.create(:uuid => '1234')
      event2 = klass.new(:uuid => '1234')

      expect(event2.valid?).to eq false
    end
  end

end
