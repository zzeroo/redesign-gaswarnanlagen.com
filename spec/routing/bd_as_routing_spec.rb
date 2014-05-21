require "spec_helper"

describe BdasController do
  describe "routing" do

    it "routes to #index" do
      get("/bdas").should route_to("bdas#index")
    end

    it "routes to #new" do
      get("/bdas/new").should route_to("bdas#new")
    end

    it "routes to #show" do
      get("/bdas/1").should route_to("bdas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bdas/1/edit").should route_to("bdas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bdas").should route_to("bdas#create")
    end

    it "routes to #update" do
      put("/bdas/1").should route_to("bdas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bdas/1").should route_to("bdas#destroy", :id => "1")
    end

  end
end
