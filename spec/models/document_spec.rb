require 'spec_helper'

describe Document do
  before do
    @document = FactoryGirl.create(:document)
  end

  subject { @document }

  it { should respond_to(:title) }
  it { should respond_to(:body) }

end
