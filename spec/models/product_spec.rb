require 'spec_helper'

describe Product do

  let(:product_group) { FactoryGirl.create(:product_group) }
  before do
    @product = product_group.products.build(number: "1230-12345678", description: "GKMF-H-HC-100UEG", short_description: "Lorem ipsum")
  end

  subject { @product }

  it { should respond_to(:number) }
  it { should respond_to(:description) }
  it { should respond_to(:short_description) }
  it { should respond_to(:product_group_id) }

  describe "when product_group_id is not present" do
    before { @product.product_group_id = nil }
    it { should_not be_valid }
  end

  describe "when number is not present" do
    before { @product.number = nil }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @product.description = nil }
    it { should_not be_valid }
  end


end
