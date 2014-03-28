require 'spec_helper'

describe "ProductGroups pages" do
 
  subject { page }

  describe "index" do

    let(:admin) { FactoryGirl.create(:admin) }
    let(:user) { FactoryGirl.create(:user) }
    let!(:product_group) { FactoryGirl.create(:product_group, published: true ) }

    before do
      sign_in user
      visit product_groups_path
    end

    it { should have_title('Produkt Gruppen') }
    it { should have_content('Produkt Gruppen') }

    it "should list all product groups" do
      ProductGroup.all.each do |product_group|
        expect(page).to have_selector('li', text: product_group.name )
        expect(page).to have_selector('li', text: product_group.description )
      end
    end
      
    describe "should show a link to product group" do
      it { should have_link(product_group.name, href: product_group_path(product_group)) }
    end

    describe "as not signedin user" do
      before do
        visit product_groups_path
      end
      it { should_not have_link 'Neue Produkt Gruppe erstellen' }

      it { should_not have_link('bearbeiten', edit_product_group_path(product_group)) }
    end
      
    describe "as user" do
      before do
        sign_in user
        visit product_groups_path
      end

      it { should_not have_link 'Neue Produkt Gruppe erstellen' }
      it { should_not have_link('bearbeiten', edit_product_group_path(product_group)) }
    end
      
    describe "as admin" do
      before do
        sign_in admin
        visit product_groups_path
      end

      it { should have_link 'Neue Produkt Gruppe erstellen' }
      it { should have_link('bearbeiten', edit_product_group_path(product_group)) }
    end
  end

  describe "product_group show page" do
    let(:product_group) { FactoryGirl.create(:product_group, product_nr_prefix: "100") }
    let!(:product1) { FactoryGirl.create(:product, product_nr: "100-12345678") }
    let!(:product2) { FactoryGirl.create(:product, product_nr: "200-12345678") }

    before{ visit product_group_path(product_group) }

    it { should have_content(product_group.name) }
    it { should have_title(product_group.name) }

    describe "list of products" do
      it { should have_content(product1.product_nr) }
      it { should have_content(product1.description) }
      it { should have_content(product1.short_description) }
    end
  end
 
  describe "new product group page" do
    before { visit new_product_group_path }

    it { should have_title('Neue Produkt Gruppe anlegen') }
    it { should have_content('Neue Produkt Gruppe anlegen') }
  end
end
