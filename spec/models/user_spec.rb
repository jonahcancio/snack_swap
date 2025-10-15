require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#similar_snacks" do
    let(:user) { create(:user) }
    let(:flavor_red) { create(:flavor, color: "#FF0000") }
    let(:flavor_pink) { create(:flavor, color: "#FF8080") }
    let(:flavor_blue) { create(:flavor, color: "#0000FF") }
    let!(:snack1) { create(:snack, flavors: [flavor_red], users: [user]) }
    let!(:snack2) { create(:snack, flavors: [flavor_pink]) }
    let!(:snack3) { create(:snack, flavors: [flavor_blue]) }

    it "returns snacks with flavors of similar color" do
      result = user.similar_snacks
      expect(result).to include(snack2)
      expect(result).not_to include(snack3)
    end
  end

  describe "#complementary_snacks" do
    let(:user) { create(:user) }
    let(:flavor_red)    { create(:flavor, color: "#FF0000") }
    let(:flavor_cyan)   { create(:flavor, color: "#00FFFF") }
    let(:flavor_blue)   { create(:flavor, color: "#0000FF") }
    let!(:snack1) { create(:snack, flavors: [flavor_red], users: [user]) }
    let!(:snack2) { create(:snack, flavors: [flavor_cyan]) }
    let!(:snack3) { create(:snack, flavors: [flavor_blue]) }

    it "returns snacks with flavors of complementary color" do
      result = user.complementary_snacks
      expect(result).to include(snack2)
      expect(result).not_to include(snack3)
    end
  end
end
