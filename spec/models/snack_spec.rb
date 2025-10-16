require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe ".most_popular" do
    let(:snack1) { create(:snack, name: "Choco Bites") }
    let(:snack2) { create(:snack, name: "Peanut Crunch") }
    let(:snack3) { create(:snack, name: "Caramel Pop") }

    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:user3) { create(:user) }

    before do
      snack1.users << [user1]
      snack2.users << [user1, user2, user3]
      snack3.users << [user1, user2]
    end

    it "returns the snack with the most associated users" do
      expect(Snack.most_popular).to eq(snack2)
    end

    it "returns nil if there are no snacks" do
      Snack.destroy_all
      expect(Snack.most_popular).to be_nil
    end
  end
end
