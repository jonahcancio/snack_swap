require 'rails_helper'

RSpec.describe "flavors/new", type: :view do
  before(:each) do
    assign(:flavor, Flavor.new(
      name: "MyString",
      color: "MyString",
      score: 1.5
    ))
  end

  it "renders new flavor form" do
    render

    assert_select "form[action=?][method=?]", flavors_path, "post" do

      assert_select "input[name=?]", "flavor[name]"

      assert_select "input[name=?]", "flavor[color]"

      assert_select "input[name=?]", "flavor[score]"
    end
  end
end
