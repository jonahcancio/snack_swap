require 'rails_helper'

RSpec.describe "snacks/new", type: :view do
  before(:each) do
    assign(:snack, Snack.new(
      name: "MyString",
      description: "MyString",
      img_url: "MyString"
    ))
  end

  it "renders new snack form" do
    render

    assert_select "form[action=?][method=?]", snacks_path, "post" do

      assert_select "input[name=?]", "snack[name]"

      assert_select "input[name=?]", "snack[description]"

      assert_select "input[name=?]", "snack[img_url]"
    end
  end
end
