require "rails_helper"

describe ClubOwnersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/club_owners").to route_to("club_owners#index")
    end

    it "routes to #new" do
      expect(:get => "/club_owners/new").to route_to("club_owners#new")
    end

    it "routes to #show" do
      expect(:get => "/club_owners/1").to route_to("club_owners#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/club_owners/1/edit").to route_to("club_owners#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/club_owners").to route_to("club_owners#create")
    end

    it "routes to #update" do
      expect(:put => "/club_owners/1").to route_to("club_owners#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/club_owners/1").to route_to("club_owners#destroy", :id => "1")
    end

  end
end
