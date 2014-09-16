require 'spec_helper'

describe "Categories" do
  describe "GET /categories" do
    it "displays products if present" do
      FactoryGirl.create(:product)
      visit categories_path
    end
  end
end
