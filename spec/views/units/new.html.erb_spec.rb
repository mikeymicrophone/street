require 'rails_helper'

RSpec.describe "units/new", type: :view do
  before(:each) do
    assign(:unit, Unit.new(
      :building => nil,
      :bedrooms => 1,
      :floor => 1,
      :name => "MyString"
    ))
  end

  it "renders new unit form" do
    render

    assert_select "form[action=?][method=?]", units_path, "post" do

      assert_select "input#unit_building_id[name=?]", "unit[building_id]"

      assert_select "input#unit_bedrooms[name=?]", "unit[bedrooms]"

      assert_select "input#unit_floor[name=?]", "unit[floor]"

      assert_select "input#unit_name[name=?]", "unit[name]"
    end
  end
end
