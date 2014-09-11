require 'spec_helper'

describe "categories/index.html.erb" do

  context "with zero category" do

    #TODO: Add test for empty category circumstance
    xit 'should display a proper error message' do
      render
      view.should contain("Noch keine Kategorie vorhanden.")
    end
  end

  context "with zero products" do
    let!(:category){ FactoryGirl.create(:category) }
    let!(:product){ FactoryGirl.create(:product) }

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
