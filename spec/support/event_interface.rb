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
    it { should validate_presence_of(:uuid) }
    it { should validate_uniqueness_of(:uuid) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:happened_at) }
    it { should validate_presence_of(:url) }
  end

end
