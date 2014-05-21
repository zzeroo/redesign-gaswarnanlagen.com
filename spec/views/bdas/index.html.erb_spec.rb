require 'spec_helper'

describe "bdas/index" do
  before(:each) do
    assign(:bdas, [
      stub_model(Bda,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Bda,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of bdas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
