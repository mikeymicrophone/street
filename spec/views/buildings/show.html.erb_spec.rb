require 'rails_helper'

RSpec.describe "buildings/show", type: :view do
  before(:each) do
    @building = assign(:building, Building.create!(
      :name => "Name",
      :stories => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
