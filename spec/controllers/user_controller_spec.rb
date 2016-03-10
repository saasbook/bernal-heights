require 'spec_helper'

describe UserController do
  login_admin

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  it "should get index" do
    get 'index'
    expect(response).to be_success
  end
  
  describe "GET new" do
    it "renders the login template", :pending => 'unimplemented' do
      get :new
      expect(response).to render_template("login")
    end
    
    context "when already logged in", :pending => 'unimplemented' do
      it "redirects to home page" do
        expect(response).to redirect_to("home")
      end
    end
  end
  
  describe "POST create", :pending => 'unimplemented' do
    it "redirects to home page" do
      expect(response).to redirect_to("home")
    end
  end
end
