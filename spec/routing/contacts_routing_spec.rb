require "spec_helper"

describe ContactsController do
  describe "routing" do

    it "routes to #index" do
      get("/ams/contacts").should route_to("contacts#index")
    end

    it "routes to #new" do
      get("/ams/contacts/new").should route_to("contacts#new")
    end

    it "routes to #show" do
      get("/ams/contacts/1").should route_to("contacts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ams/contacts/1/edit").should route_to("contacts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ams/contacts").should route_to("contacts#create")
    end

    it "routes to #update" do
      put("/ams/contacts/1").should route_to("contacts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ams/contacts/1").should route_to("contacts#destroy", :id => "1")
    end

  end
end
