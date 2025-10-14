require 'rails_helper'

RSpec.describe "flavors/edit", type: :view do
  let(:flavor) {
    Flavor.create!(
      name: "MyString",
      color: "MyString",
      score: 1.5
    )
  }

  before(:each) do
    assign(:flavor, flavor)
  end

  it "renders the edit flavor form" do
    render

    assert_select "form[action=?][method=?]", flavor_path(flavor), "post" do

      assert_select "input[name=?]", "flavor[name]"

      assert_select "input[name=?]", "flavor[color]"

      assert_select "input[name=?]", "flavor[score]"
    end
  end
end
