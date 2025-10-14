require 'rails_helper'

RSpec.describe "flavors/show", type: :view do
  before(:each) do
    assign(:flavor, Flavor.create!(
      name: "Name",
      color: "Color",
      score: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/2.5/)
  end
end
