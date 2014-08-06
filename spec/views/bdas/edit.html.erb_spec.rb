require 'spec_helper'

describe "bdas/edit" do
  before(:each) do
    @bda = assign(:bda, stub_model(Bda,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit bda form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bda_path(@bda), "post" do
      assert_select "input#bda_name[name=?]", "bda[name]"
      assert_select "input#bda_description[name=?]", "bda[description]"
    end
  end
end
