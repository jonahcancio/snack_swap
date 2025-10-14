require 'rails_helper'

RSpec.describe "snacks/index", type: :view do
  before(:each) do
    assign(:snacks, [
      Snack.create!(
        name: "Name",
        description: "Description",
        img_url: "Img Url"
      ),
      Snack.create!(
        name: "Name",
        description: "Description",
        img_url: "Img Url"
      )
    ])
  end

  it "renders a list of snacks" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Img Url".to_s), count: 2
  end
end
