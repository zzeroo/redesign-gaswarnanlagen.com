require 'spec_helper'

describe News do

  before do
    @news = FactoryBot.create(:news)
  end

  subject { @news }

  it { should respond_to(:title) }
  it { should respond_to(:news_body) }

end
