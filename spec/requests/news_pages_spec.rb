require 'spec_helper'

describe "NewsPages" do
  subject { page }

  describe "index" do
    before(:all) do
      visit news_index_path
    end

    it { should have_title('Aktuell') }
  end
end
