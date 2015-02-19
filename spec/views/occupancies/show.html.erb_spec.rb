require 'rails_helper'

RSpec.describe "occupancies/show", type: :view do
  before(:each) do
    @occupancy = assign(:occupancy, Fabricate(:occupancy))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{Occupancy.first.unit.name}/)
    expect(rendered).to match(/#{Occupancy.first.resident.name}/)
  end
end
