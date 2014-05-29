require 'spec_helper'

describe "Categories pages" do

  let(:admin) { FactoryGirl.create(:admin) }
  let(:user) { FactoryGirl.create(:user) }

  subject { page }

  describe "index" do
    let!(:category) { FactoryGirl.create(:category, published: true ) }

    before do
      visit categories_path
    end

    it { should have_title('Produkt Kategorien') }
    it { should have_content('Produkt Kategorien') }

    it "should list all root categories those without parents" do
      Category.where(parent: nil).each do |category|
        expect(page).to have_selector('strong', text: category.name )
        expect(page).to have_selector('p', text: category.description )
      end
    end

    describe "should show a link to category" do
      it { should have_link(category.name, href: category_path(category)) }
    end

    describe "as not signedin user" do
      before do
        visit categories_path
      end
      it { should_not have_link 'Neue Produkt Kategorie erstellen' }
      it { should_not have_link('bearbeiten', edit_category_path(category)) }
    end

    describe "as user" do
      before do
        sign_in user
        visit categories_path
      end

      it { should_not have_link 'Neue Produkt Kategorie erstellen' }
      it { should_not have_link('bearbeiten', edit_category_path(category)) }
    end

    describe "as admin" do
      before do
        sign_in admin
        visit categories_path
      end

      it { should have_link 'Neue Produkt Kategorie erstellen' }
      it { should have_link('bearbeiten', edit_category_path(category)) }
    end
  end

  describe "category show page" do
    let(:category) { FactoryGirl.create(:category, product_nr_prefix: "100") }
    let!(:product1) { FactoryGirl.create(:product, product_nr: "100-12345678") }
    let!(:product2) { FactoryGirl.create(:product, product_nr: "200-12345678") }

    before{ visit category_path(category) }

    it { should have_content(category.name) }
    it { should have_title(category.name) }

    describe "list of products" do
      it { should have_content(product1.product_nr) }
      it { should have_content(product1.description) }
      it { should have_content(product1.short_description) }
    end

    describe "as user" do
      before do
        sign_in user
        visit categories_path(category)
      end

      it { should_not have_link('bearbeiten', edit_category_path(category)) }
    end

    describe "as admin" do
      before do
        sign_in admin
        visit categories_path(category)
      end

      it { should have_link('bearbeiten', edit_category_path(category)) }
    end
  end

  describe "new category_page" do

    before do 
      sign_in admin
      visit new_category_path
    end

    it { should have_title('Neue Produkt Kategorie anlegen') }
    it { should have_content('Neue Produkt Kategorie anlegen') }

    describe "with invalid information" do
      it "should not create category" do
        expect { click_button "Produkt Kategorie erstellen" }.not_to change(Category, :count)
      end

      describe "error messages" do
        before { click_button "Produkt Kategorie erstellen" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before { fill_in 'category_name', with: "Lorem ipsum" }
      it "should create a prodcut group" do
        expect { click_button "Produkt Kategorie erstellen" }.to change(Category, :count).by(1)
      end
    end
  end

  describe "edit" do
    let(:category) { FactoryGirl.create(:category) }

    before do
      visit edit_category_path(category)
    end

    describe "as admin" do
      before do
        sign_in admin
        visit edit_category_path(category)
      end

      describe "page" do
        it { should have_content('Produkt Kategorie bearbeiten') }
        it { should have_title('Produkt Kategorie bearbeiten') }
      end
    end
  end

  describe "delete category" do
    before { FactoryGirl.create(:user) }
    before { FactoryGirl.create(:admin) }

    describe "as non signed_in user" do
      before { visit categories_path }

      it { should_not have_link('löschen') }
    end

    describe "as signed_in user" do
      before do
        sign_in user
        visit categories_path
      end

      it { should_not have_link('löschen') }
    end

    describe "as admin" do
      before do
        sign_in admin
        FactoryGirl.create(:category, published: true)
        visit categories_path
      end

      it { should have_link 'löschen' }
      it "should delete a category" do
        expect { click_link "löschen" }.to change(Category, :count).by(-1)
      end
    end

  end
end
