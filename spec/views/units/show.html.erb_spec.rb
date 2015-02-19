require 'rails_helper'

RSpec.describe "units/show", type: :view do
  before(:each) do
    @unit = assign(:unit, Fabricate(:unit))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{Unit.first.building.name}/)
    expect(rendered).to match(/#{Unit.first.floor}/)
    expect(rendered).to match(/#{Unit.first.bedrooms}/)
    expect(rendered).to match(/#{Unit.first.name}/)
  end
end
