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
  
  it "can be approved", :pending => 'unimplemented' do
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
  
  describe "#confirm_event" do
    context "admin user" do
      it "gets approved"
    end
    
    context "non-admin user" do
      it "does not get approved"
    end
  end
  
end
