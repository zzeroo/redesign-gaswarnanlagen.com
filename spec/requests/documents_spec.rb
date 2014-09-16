require 'spec_helper'

describe "Documents" do
  describe "GET /documents" do
    it "works!" do
      get documents_path
      response.status.should be(200)
    end
  end
end
