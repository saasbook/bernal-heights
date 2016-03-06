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
  
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:start_date) }
  it { is_expected.to respond_to(:start_time) }
  it { is_expected.to respond_to(:end_date) }
  it { is_expected.to respond_to(:end_time) }
  it { is_expected.to respond_to(:location) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:creator_name) }
  it { is_expected.to respond_to(:creator_email) }
  it { is_expected.to respond_to(:event_organizer) }
  it { is_expected.to respond_to(:approved) :pending => 'unimplemented' }
  it { is_expected.to respond_to(:event_photo) :pending => 'unimplemented' }
  
  it "has a valid factory"
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
