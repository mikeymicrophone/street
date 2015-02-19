require 'rails_helper'

RSpec.describe "units/edit", type: :view do
  before(:each) do
    @unit = assign(:unit, Fabricate(:unit))
  end

  it "renders the edit unit form" do
    render

    assert_select "form[action=?][method=?]", unit_path(@unit), "post" do

      assert_select "input#unit_building_id[name=?]", "unit[building_id]"

      assert_select "input#unit_bedrooms[name=?]", "unit[bedrooms]"

      assert_select "input#unit_floor[name=?]", "unit[floor]"

      assert_select "input#unit_name[name=?]", "unit[name]"
    end
  end
end
