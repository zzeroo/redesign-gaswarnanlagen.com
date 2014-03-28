require 'spec_helper'

describe ProductGroup do

  before do
    @product_group = FactoryGirl.create(:product_group)
  end

  subject { @product_group }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:published) }    # TODO: could be removed
  it { should respond_to(:product_nr_prefix)}
  
  describe "when name is not present" do
    before { @product_group.name = nil }
    it { should_not be_valid }
  end

  describe "product associations" do
    it { should respond_to(:products) }
    before do
    end
  end
end
