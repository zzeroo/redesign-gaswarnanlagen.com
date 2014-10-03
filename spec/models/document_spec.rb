require 'spec_helper'

describe Document do
  before do
    @document = FactoryGirl.build(:document)
  end

  subject { @document }

  it { should respond_to(:title) }
  it { should respond_to(:desc) }
end
