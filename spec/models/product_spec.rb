require 'spec_helper'

describe Product do

  before do
    @product = FactoryGirl.create(:product)
  end

  subject { @product }

  it { should respond_to(:product_nr) }
  it { should respond_to(:description) }
  it { should respond_to(:short_description) }
  it { should respond_to(:product_group_id) }

  describe "when product_nr is not present" do
    before { @product.product_nr = nil }
    it { should_not be_valid }
  end

  describe "when product_nr is not unique" do
    let!(:product) { FactoryGirl.create(:product, product_nr: "1") }
    let!(:product2) { Product.new(product_nr: "1") }

    it "should not be valid" do
      expect(product2).not_to be_valid
    end
  end

  describe "default ordering scope" do
    before { Product.all.each{|p| p.destroy! }}
    let!(:higher_product_nr) do
      FactoryGirl.create(:product, product_nr: "999-99999999")
    end
    let!(:lower_product_nr) do
      FactoryGirl.create(:product, product_nr: "100-00000001" )
    end

    it "should have the right products in the right order (lower product_numer first)" do
      expect(Product.all.to_a).to eq [lower_product_nr, higher_product_nr]
    end
  end

end
