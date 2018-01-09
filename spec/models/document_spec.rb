require 'spec_helper'

describe Document do
  before do
    @document = FactoryBot.build(:document)
  end

  subject { @document }

  it { should respond_to(:title) }
  it { should respond_to(:desc) }
end
