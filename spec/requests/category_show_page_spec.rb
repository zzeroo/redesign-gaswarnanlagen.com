require 'spec_helper'

describe "Categories" do
  describe "GET /categories" do
    it "displays products if present" do
      FactoryBot.create(:product)
      visit categories_path
    end
  end
end
