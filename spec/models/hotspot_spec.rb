require 'spec_helper'
# Schema

# Table name: hotspots
    # t.string   "location"
    # t.string   "details"
    # t.integer  "report_num"
    # t.boolean  "to_share",       default: false
    # t.string   "creator_name"
    # t.string   "creator_email"
    # t.string   "creator_number"
    # t.datetime "created_at",                     null: false
    # t.datetime "updated_at",                     null: false
    # t.float    "latitude"
    # t.float    "longitude"
    # t.boolean  "walk",           default: false
    # t.date     "occurred_date"
    # t.time     "occurred_time"
    # t.string   "region"
    # t.boolean  "archive",        default: false
    # t.string   "status"

describe Hotspot do
  let(:hotspot) { FactoryGirl.build(:hotspot) }
  
  subject { hotspot }

  it "has a valid factory" do
    expect(FactoryGirl.create(:hotspot)).to be_valid
  end
  
  it "is invalid without a location" do
    expect(FactoryGirl.build(:hotspot, location: nil)).to be_invalid
  end
    
  it "is invalid without an occurred time" do
    expect(FactoryGirl.build(:hotspot, occurred_time: nil)).to be_invalid
  end
  
  it "is invalid without a occurred date" do
    expect(FactoryGirl.build(:hotspot, occurred_date: nil)).to be_invalid
  end
  
  it "is invalid without details" do
    expect(FactoryGirl.build(:hotspot, details: nil)).to be_invalid
  end
  
  it "is invalid without a creator name" do
    expect(FactoryGirl.build(:hotspot, creator_name: nil)).to be_invalid
  end
  
  it "is invalid without a creator email" do
    expect(FactoryGirl.build(:hotspot, creator_email: nil)).to be_invalid
  end
  
  it "is invalid without a creator number" do
    expect(FactoryGirl.build(:hotspot, creator_number: nil)).to be_invalid
  end
  
  it "starts out as unarchived" do
    expect(hotspot.archive).to be_false
  end
  
  describe "#confirm" do
    before { @event_a = FactoryGirl.create(:event, approved: false)}
    it "confirms event" do
      @event_a.confirm
      expect(@event_a.approved).to be true
    end
  end
  
  describe "@@all_archived" do
    before do
      @hotspot_a = FactoryGirl.create(:hotspot, archive: false)
      @hotspot_b = FactoryGirl.create(:hotspot, archive: false)
      @hotspot_c = FactoryGirl.create(:hotspot, archive: true)
    end
    
    it "returns all archived hotspots" do
      expect(Hotspot.all_archived).to include(@hotspot_c)
    end
    
    it "does not return unarchived hotspots" do
      expect(Hotspot.all_archived).to_not include(@hotspot_a, @hotspot_b)
    end
  end
  
  describe "@@all_unarchived" do
    before do
      @hotspot_a = FactoryGirl.create(:hotspot, archive: false)
      @hotspot_b = FactoryGirl.create(:hotspot, archive: false)
      @hotspot_c = FactoryGirl.create(:hotspot, archive: true)
    end
    
    it "returns all unarchived hotspots" do
      expect(Hotspot.all_unarchived).to include(@hotspot_a, @hotspot_b)
    end
    
    it "does not return archived hotspots" do
      expect(Hotspot.all_unarchived).to_not include(@hotspot_c)
    end
  end
end
