require 'spec_helper'

describe "product_groups/edit" do
  before(:each) do
    @product_group = assign(:product_group, stub_model(ProductGroup,
      :name => "ProductGroupName",
      :description => "ProductGroupDescription"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_group_path(@product_group), "post" do
      assert_select "input#product_group_name[name=?]", "product_group[name]"
      assert_select "textarea#product_group_description[name=?]", "product_group[description]"
    end
  end
end

