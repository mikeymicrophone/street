require 'rails_helper'

RSpec.describe "residents/show", type: :view do
  before(:each) do
    @resident = assign(:resident, Fabricate(:resident))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{Resident.first.first_name}/)
    expect(rendered).to match(/#{Resident.first.last_name}/)
  end
end
