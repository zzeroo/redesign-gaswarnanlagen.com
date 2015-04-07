require 'spec_helper'

describe "categories/index.html.erb" do

  context "with zero category" do

  end

  context "with zero products" do
    let!(:category) { FactoryGirl.create(:category) }
    let!(:product) { FactoryGirl.create(:product) }

    before(:each) do
      assign(:categories, [
        category
      ])
    end

    it 'should render _button_new_categories' do
      render
      view.should render_template(partial: "_button_new_category")
    end
  end
end
