require 'spec_helper'

describe ProductGroup do

  #let(:product_group) { FactoryGirl.create(:product_group) }
  before do
    @product_group = ProductGroup.new(name: "CO Warnanlage", description: "Lorem ipsum")
  end

  subject { @product_group }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:products) }
  
  describe "when name is not present" do
    before { @product_group.name = nil }
    it { should_not be_valid }
  end

  describe "product associations" do
    
    before {@product_group.save }
    let!(:higher_product_number) do
      FactoryGirl.create(:product, product_group: @product_group, number: "123-99999999")
    end
    let!(:lower_product_number) do
      FactoryGirl.create(:product, product_group: @product_group, number: "123-00000001" )
    end

    it "should have the right products in the right order (lower product_numer first)" do
      expect(@product_group.products.to_a).to eq [lower_product_number, higher_product_number]
    end

    it "should destroy associated products" do
      products = @product_group.products.to_a
      @product_group.destroy
      expect(products).not_to be_empty
      products.each do |product|
        expect(Product.where(id: product.id)).to be_empty
      end
    end
  end
end
