require 'spec_helper'

describe User do 
  let(:user) { FactoryGirl.build(:user) }
  
  subject { user }
  describe "it supports omniauth login", :pending => 'unimplemented' do
    it "has a uid" do
      expect(user).to respond_to(:uid)
    end
    
    it "has a provider", :pending => 'unimplemented' do
      expect(user).to respond_to(:provider)
    end
  end
  
  it "has an email", :pending => 'unimplemented' do
    expect(user).to respond_to(:email)
  end
  
  it "has a password", :pending => 'unimplemented' do
    expect(user).to respond_to(:password)
  end
  
  it "has a password confirmation", :pending => 'unimplemented' do
    expect(user).to respond_to(:password_confirmation)
  end
  
end
