require 'rails_helper'

RSpec.describe "buildings/index", type: :view do
  before(:each) do
    assign(:buildings, [
      Building.create!(
        :name => "Name",
        :stories => 1
      ),
      Building.create!(
        :name => "Name",
        :stories => 1
      )
    ])
  end

  it "renders a list of buildings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
