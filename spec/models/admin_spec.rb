require 'spec_helper'

describe Admin do 
  let(:admin) { FactoryGirl.build(:admin) }
  
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
  
  it "validates name" do
    expect( FactoryGirl.build(:admin, name: "")).to_not be_valid
  end
  
  it "validates email" do
    expect(FactoryGirl.build(:admin, email: "fail")).to_not be_valid
  end

end
