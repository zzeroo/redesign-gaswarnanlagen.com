require 'spec_helper'

describe "bdas/new" do
  before(:each) do
    assign(:bda, stub_model(Bda,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new bda form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bdas_path, "post" do
      assert_select "input#bda_name[name=?]", "bda[name]"
      assert_select "textarea#bda_description[name=?]", "bda[description]"
    end
  end
end
