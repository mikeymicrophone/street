require "rails_helper"

RSpec.describe OccupanciesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/occupancies").to route_to("occupancies#index")
    end

    it "routes to #new" do
      expect(:get => "/occupancies/new").to route_to("occupancies#new")
    end

    it "routes to #show" do
      expect(:get => "/occupancies/1").to route_to("occupancies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/occupancies/1/edit").to route_to("occupancies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/occupancies").to route_to("occupancies#create")
    end

    it "routes to #update" do
      expect(:put => "/occupancies/1").to route_to("occupancies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/occupancies/1").to route_to("occupancies#destroy", :id => "1")
    end

  end
end
