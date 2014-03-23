require 'spec_helper'

describe "GET index" do

  subject { page }

  describe "basic look and feel" do

    before { visit root_path }

    it { should have_link('', href: root_path) }
  end
end
