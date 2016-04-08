require 'spec_helper'
# Schema

# Table name: events
    # t.string   "name"
    # t.date     "start_date"
    # t.time     "start_time"
    # t.date     "end_date"
    # t.time     "end_time"
    # t.string   "location"
    # t.text     "description"
    # t.string   "creator_name"
    # t.string   "creator_email"
    # t.string   "event_organizer"
    # t.datetime "created_at",      null: false
    # t.datetime "updated_at",      null: false

describe Event do
  let(:event) { FactoryGirl.build(:event) }
  
  subject { event }
  
  it "has a name" do
    expect(event).to respond_to(:name)
  end
  
  it "has a start date" do
    expect(event).to respond_to(:start_date)
  end
  
  it "has a start time" do
    expect(event).to respond_to(:start_time)
  end
  
  it "has an end date" do
    expect(event).to respond_to(:end_date)
  end
  
  it "has an end_time" do
    expect(event).to respond_to(:end_time)
  end
  
  it "has a location" do
    expect(event).to respond_to(:location)
  end
  
  it "has a description" do
    expect(event).to respond_to(:description)
  end
  
  it "has a creator name" do
    expect(event).to respond_to(:creator_name)
  end
  
  it "has a creator email" do
    expect(event).to respond_to(:creator_email)
  end
  
  it "has an event organizer" do
    expect(event).to respond_to(:event_organizer)
  end
  
  it "has an event photo", :pending => 'unimplemented' do
    expect(event).to respond_to(:event_photo)
  end
  
  it "can be marked as approved" do
    expect(event).to respond_to(:approved)
  end

  
  it "has a valid factory" do
    expect(FactoryGirl.create(:event)).to be_valid
  end
  
  it "is invalid without a name" do
    expect(FactoryGirl.build(:event, name: nil)).to be_invalid
  end
    
  it "is invalid without a start date" do
    expect(FactoryGirl.build(:event, start_date: nil)).to be_invalid
  end
  
  it "is invalid without a start time" do
    expect(FactoryGirl.build(:event, start_time: nil)).to be_invalid
  end
  
  it "is invalid without a location" do
    expect(FactoryGirl.build(:event, location: nil)).to be_invalid
  end
  
  it "is invalid without a creator name" do
    expect(FactoryGirl.build(:event, creator_name: nil)).to be_invalid
  end
  
  it "is invalid without a creator email" do
    expect(FactoryGirl.build(:event, creator_email: nil)).to be_invalid
  end
  
  it "starts out as unapproved" do
    expect(event.approved).to be_false
  end
  
  describe "#confirm" do
    before { @event_a = FactoryGirl.create(:event, approved: false)}
    it "confirms event" do
      @event_a.confirm
      expect(@event_a.approved).to be true
    end
  end
  
  describe "@@get_all_unconfirmed" do
    before do
      @event_a = FactoryGirl.create(:event, approved: false)
      @event_b = FactoryGirl.create(:event, approved: false)
      @event_c = FactoryGirl.create(:event, approved: true)
    end
    
    it "returns all unapproved events" do
      expect(Event.get_all_unconfirmed).to include(@event_a, @event_b)
    end
    
    it "does not return approved events" do
      expect(Event.get_all_unconfirmed).to_not include(@event_c)
    end
  end
end
