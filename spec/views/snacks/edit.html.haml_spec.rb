require 'rails_helper'

RSpec.describe "snacks/edit", type: :view do
  let(:snack) {
    Snack.create!(
      name: "MyString",
      description: "MyString",
      img_url: "MyString"
    )
  }

  before(:each) do
    assign(:snack, snack)
  end

  it "renders the edit snack form" do
    render

    assert_select "form[action=?][method=?]", snack_path(snack), "post" do

      assert_select "input[name=?]", "snack[name]"

      assert_select "input[name=?]", "snack[description]"

      assert_select "input[name=?]", "snack[img_url]"
    end
  end
end
