require 'spec_helper'

describe "Bdas pages" do

  let(:bda) { FactoryBot.create(:bda) }

  subject { page }

  describe "index" do
    before do
      visit bdas_path
    end

    it { should have_title('Betriebsanleitungen') }
    it { should have_content('Betriebsanleitungen') }

  end
end
