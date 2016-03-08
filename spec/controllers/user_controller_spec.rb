require 'spec_helper'

describe UserController do
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
