require 'spec_helper'

describe "ProductGroups pages" do

  let(:admin) { FactoryGirl.create(:admin) }
  let(:user) { FactoryGirl.create(:user) }

  subject { page }

  describe "index" do
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

  describe "new product group_page" do

    before do 
      sign_in admin
      visit new_product_group_path
    end

    it { should have_title('Neue Produkt Gruppe anlegen') }
    it { should have_content('Neue Produkt Gruppe anlegen') }

    describe "with invalid information" do
      it "should not create product_group" do
        expect { click_button "Produktgruppe erstellen" }.not_to change(ProductGroup, :count)
      end

      describe "error messages" do
        before { click_button "Produktgruppe erstellen" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before { fill_in 'product_group_name', with: "Lorem ipsum" }
      it "should create a prodcut group" do
        expect { click_button "Produktgruppe erstellen" }.to change(ProductGroup, :count).by(1)
      end
    end
  end

  describe "edit" do
    let(:product_group) { FactoryGirl.create(:product_group) }

    before do
      visit edit_product_group_path(product_group)
    end

    describe "as admin" do
      before do
        sign_in admin
        visit edit_product_group_path(product_group)
      end

      describe "page" do
        it { should have_content('Produktgruppe bearbeiten') }
        it { should have_title('Produktgruppe bearbeiten') }
      end
    end
  end

  describe "delete product_group" do
    before { FactoryGirl.create(:user) }
    before { FactoryGirl.create(:admin) }

    describe "as non signed_in user" do
      before { visit product_groups_path }

      it { should_not have_link('löschen') }
    end

    describe "as signed_in user" do
      before do
        sign_in user
        visit product_groups_path
      end

      it { should_not have_link('löschen') }
    end

    describe "as admin" do
      before do
        sign_in admin
        FactoryGirl.create(:product_group, published: true)
        visit product_groups_path
      end

      it { should have_link 'löschen' }
      it "should delete a product_group" do
        expect { click_link "löschen" }.to change(ProductGroup, :count).by(-1)
      end
    end

  end
end
