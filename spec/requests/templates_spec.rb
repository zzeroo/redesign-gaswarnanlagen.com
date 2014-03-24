require 'spec_helper'

describe "GET index" do

  subject { page }

  describe "basic look and feel" do

    before { visit root_path }

    it { should have_link('', href: root_path) }

    describe "as non admin user" do
      it { should_not have_link('Produkte', href: products_path) }
      it { should_not have_link('Produkt Gruppen', href: product_groups_path) }
    end

    describe "as admin user" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_link('Produkte', href: products_path) }
      it { should have_link('Produkt Gruppen', href: product_groups_path) }
    end
  end
end
