require 'rails_helper'

RSpec.describe "residents/edit", type: :view do
  before(:each) do
    @resident = assign(:resident, Fabricate(:resident))
  end

  it "renders the edit resident form" do
    render

    assert_select "form[action=?][method=?]", resident_path(@resident), "post" do

      assert_select "input#resident_first_name[name=?]", "resident[first_name]"

      assert_select "input#resident_last_name[name=?]", "resident[last_name]"
    end
  end
end
