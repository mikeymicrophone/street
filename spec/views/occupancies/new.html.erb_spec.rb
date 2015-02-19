require 'rails_helper'

RSpec.describe "occupancies/new", type: :view do
  before(:each) do
    assign(:occupancy, Occupancy.new(
      :unit => nil,
      :resident => nil
    ))
  end

  it "renders new occupancy form" do
    render

    assert_select "form[action=?][method=?]", occupancies_path, "post" do

      assert_select "select#occupancy_unit_id[name=?]", "occupancy[unit_id]"

      assert_select "select#occupancy_resident_id[name=?]", "occupancy[resident_id]"
    end
  end
end
