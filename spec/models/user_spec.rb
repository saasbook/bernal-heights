require 'spec_helper'

describe User do 
  let(:user) { FactoryGirl.build(:user) }
  let(:admin) { FactoryGirl.build(:admin) }

  describe "it supports omniauth login" do
    it "has a uid" do
      expect(user).to respond_to(:uid)
    end
    
    it "has a provider" do
      expect(user).to respond_to(:provider)
    end
  end
  
  describe "it has admin users" do
    it "creates non-admins by default" do
      expect(user.admin).to be_false
    end
    it "has admin users when admin field is true" do
      expect(admin.admin).to be_true
    end 
  end
  
  
  it "has an email" do
    expect(user).to respond_to(:email)
  end
  
  it "has a password" do
    expect(user).to respond_to(:password)
  end
  
  it "has a password confirmation" do
    expect(user).to respond_to(:password_confirmation)
  end
  
  it "has an admin field" do
    expect(user).to respond_to(:admin)
  end
  
  describe "#favorite_event" do
    context "The user hasn't saved this event yet" do
      it "adds event to user's saved events"
    end
    
    context "The user has already saved this event before" do
      it "does not add the event twice"
    end
  end
  
  describe "#unfavorite_event" do
    context "favorited event" do
      it "removes the event from user's saved list"
    end
    context "unfavorited event" do
      it "changes nothing"
    end
  end
    
      
    
  
end
