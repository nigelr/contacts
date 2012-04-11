require 'spec_helper'

def login
  contact
  visit new_contact_session_path
  fill_in "Email", with: contact.email
  fill_in "Password", with: "secret"
  click_button "Sign in"
end

describe "Contacts" do
  let(:contact) { FactoryGirl.create(:contact)}

  it "should login" do
    login
    page.current_path.should == "/ams"
  end

  #it "should open the dashboard" do
  #  login
  #  visit dashboard_path
  #end
end
