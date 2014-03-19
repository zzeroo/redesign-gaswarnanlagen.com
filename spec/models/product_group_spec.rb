require 'spec_helper'

describe ProductGroup do

  #let(:product_group) { FactoryGirl.create(:product_group) }
  before do
    @product_group = ProductGroup.new(name: "CO Warnanlage", description: "Lorem ipsum")
  end

  subject { @product_group }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  
  describe "when name is not present" do
    before { @product_group.name = nil }
    it { should_not be_valid }
  end


end
