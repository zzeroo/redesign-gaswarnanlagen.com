require 'spec_helper'

describe "ProductGroups pages" do
 
  subject { page }

  describe "index" do

    before do
      FactoryGirl.create(:product_group, name: "CO Warnanlagen") 
      FactoryGirl.create(:product_group, name: "Gaswarnanlagen") 
      sign_in FactoryGirl.create(:user)
      visit product_groups_path
    end

    it { should have_title('Produkt Gruppen') }
    it { should have_content('Produkt Gruppen') }
    it { should have_link 'Neue Produkt Gruppe erstellen' }

    it "should list all product groups" do
      ProductGroup.all.each do |product_group|
        expect(page).to have_selector('li', text: product_group.name )
        expect(page).to have_selector('li', text: product_group.description )
      end
    end

    describe "should show a link to product group" do
      let!(:product_group) { FactoryGirl.create(:product_group) }

      before { visit product_groups_path }

      it { should have_link(product_group.name, href: product_group_path(product_group)) }
    end
  end

  describe "product_group show page" do
    let(:product_group) { FactoryGirl.create(:product_group) }
    let!(:product1) { FactoryGirl.create(:product, product_group: product_group, description: "GMZ6") }
    let!(:product2) { FactoryGirl.create(:product, product_group: product_group, description: "GMZ12") }

    before{ visit product_group_path(product_group) }

    it { should have_content(product_group.name) }
    it { should have_title(product_group.name) }

    describe "list of products" do
      it { should have_content(product1.number) }
      it { should have_content(product1.short_description) }
      it { should have_content(product1.product_group.name) }
    end
  end
 
  describe "new product group page" do
    before { visit new_product_group_path }

    it { should have_title('Neue Produkt Gruppe anlegen') }
    it { should have_content('Neue Produkt Gruppe anlegen') }
  end
end
