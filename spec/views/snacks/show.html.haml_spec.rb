require 'rails_helper'

RSpec.describe "snacks/show", type: :view do
  before(:each) do
    assign(:snack, Snack.create!(
      name: "Name",
      description: "Description",
      img_url: "Img Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Img Url/)
  end
end
