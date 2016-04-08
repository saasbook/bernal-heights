require 'spec_helper'

describe Admin do 
  let(:admin) { FactoryGirl.build(:admin) }

  describe "it supports omniauth login" do
    it "has a uid" do
      expect(admin).to respond_to(:uid)
    end
    
    it "has a provider" do
      expect(admin).to respond_to(:provider)
    end
  end
  
  it "has a name" do
    expect(admin).to respond_to(:name)
  end
  
  it "has an email" do
    expect(admin).to respond_to(:email)
  end
  
  it "has a password" do
    expect(admin).to respond_to(:password)
  end
  
  it "has a password confirmation" do
    expect(admin).to respond_to(:password_confirmation)
  end
  
  it "has an admin field" do
    expect(admin).to respond_to(:admin)
  end
  
end
