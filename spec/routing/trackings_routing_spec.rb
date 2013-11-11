require "spec_helper"

describe TrackingsController do
  describe "routing" do

    it "routes to #index" do
      get("/trackings").should route_to("trackings#index")
    end

    it "routes to #new" do
      get("/trackings/new").should route_to("trackings#new")
    end

    it "routes to #show" do
      get("/trackings/1").should route_to("trackings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trackings/1/edit").should route_to("trackings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trackings").should route_to("trackings#create")
    end

    it "routes to #update" do
      put("/trackings/1").should route_to("trackings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trackings/1").should route_to("trackings#destroy", :id => "1")
    end

  end
end
