require 'spec_helper'

describe "Products pages" do
  describe "GET /products" do
    before(:each) do
    end

    it "has a nice page" do
      visit '/products'
    end
  end
end
