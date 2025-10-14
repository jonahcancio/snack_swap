require 'rails_helper'

RSpec.describe "flavors/index", type: :view do
  before(:each) do
    assign(:flavors, [
      Flavor.create!(
        name: "Name",
        color: "Color",
        score: 2.5
      ),
      Flavor.create!(
        name: "Name",
        color: "Color",
        score: 2.5
      )
    ])
  end

  it "renders a list of flavors" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Color".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
  end
end
