require 'rails_helper'

RSpec.describe "occupancies/edit", type: :view do
  before(:each) do
    @occupancy = assign(:occupancy, Fabricate(:occupancy))
  end

  it "renders the edit occupancy form" do
    render

    assert_select "form[action=?][method=?]", occupancy_path(@occupancy), "post" do

      assert_select "select#occupancy_unit_id[name=?]", "occupancy[unit_id]"

      assert_select "select#occupancy_resident_id[name=?]", "occupancy[resident_id]"
    end
  end
end
