require 'spec_helper'


describe "Dashboards" do
  let(:contact) { FactoryGirl.create(:contact)}

  context "when not logged in" do
    it "should go to ams sign_in" do
      visit "/ams/dashboards"
      page.current_path.should == new_contact_session_path
    end
  end

  context "when logged in" do
    before { login }
    it("should login") do
      visit "/ams/dashboards"
      page.current_path.should == "/ams/dashboards"
    end
  end
end
