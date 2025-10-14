require "rails_helper"

RSpec.describe SnacksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/snacks").to route_to("snacks#index")
    end

    it "routes to #new" do
      expect(get: "/snacks/new").to route_to("snacks#new")
    end

    it "routes to #show" do
      expect(get: "/snacks/1").to route_to("snacks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/snacks/1/edit").to route_to("snacks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/snacks").to route_to("snacks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/snacks/1").to route_to("snacks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/snacks/1").to route_to("snacks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/snacks/1").to route_to("snacks#destroy", id: "1")
    end
  end
end
