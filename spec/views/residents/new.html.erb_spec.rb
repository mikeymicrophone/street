require 'rails_helper'

RSpec.describe "residents/new", type: :view do
  before(:each) do
    assign(:resident, Resident.new(
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders new resident form" do
    render

    assert_select "form[action=?][method=?]", residents_path, "post" do

      assert_select "input#resident_first_name[name=?]", "resident[first_name]"

      assert_select "input#resident_last_name[name=?]", "resident[last_name]"
    end
  end
end
