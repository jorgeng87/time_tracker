require "spec_helper"

describe TrackingsController do
  describe "routing" do

    it "routes to #index" do
      get("/trackings").should route_to("trackings#index", format: :json)
    end

    it "routes to #show" do
      get("/trackings/1").should route_to("trackings#show", :id => "1", format: :json)
    end

    it "routes to #create" do
      post("/trackings").should route_to("trackings#create", format: :json)
    end

    it "routes to #update" do
      put("/trackings/1").should route_to("trackings#update", :id => "1", format: :json)
    end

    it "routes to #destroy" do
      delete("/trackings/1").should route_to("trackings#destroy", :id => "1", format: :json)
    end

  end
end
