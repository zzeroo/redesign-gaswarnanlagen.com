require 'spec_helper'

describe Bda do
  before do
    @bda = FactoryGirl.create(:bda)
  end

  subject { @bda }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:product_nr_prefix) }

end
