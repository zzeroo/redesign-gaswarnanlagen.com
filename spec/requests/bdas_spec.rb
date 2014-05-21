require 'spec_helper'

describe "Bdas" do
  describe "GET /bdas" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get bdas_path
      response.status.should be(200)
    end
  end
end
