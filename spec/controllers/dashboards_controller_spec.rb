require 'spec_helper'

describe DashboardsController do
  let(:contact) { FactoryGirl.create(:contact)}

  describe "GET 'index'" do
    it "should redirect if not signed in" do
      sign_out contact
      get 'index'
      response.should redirect_to new_contact_session_path
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      sign_in contact
      get 'index'
      response.should be_success
    end
  end

end
