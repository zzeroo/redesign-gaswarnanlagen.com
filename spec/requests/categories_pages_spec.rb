require 'spec_helper'

describe "Categories pages" do

  let(:admin) { FactoryBot.create(:admin) }
  let(:user) { FactoryBot.create(:user) }

  subject { page }

  describe "category/index" do
    let!(:category) { FactoryBot.create(:category, published: true) }

    before do
      visit categories_path
    end

    it { should have_title('Produkt Kategorien') }
    it { should have_content('Produkt Kategorien') }

    it "should list all root categories those without parents" do
      Category.where(parent: nil).each do |category|
        expect(page).to have_selector('strong', text: category.name)
        expect(page).to have_selector('p', text: category.description)
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
      it { should have_link('', edit_category_path(category)) }
    end
  end

  describe "category/show" do
    let(:category) { FactoryBot.create(:category, product_nr_prefix: "100") }
    let!(:product1) { FactoryBot.create(:product, product_nr: "100-12345678") }
    let!(:product2) { FactoryBot.create(:product, product_nr: "200-12345678") }

    before { visit category_path(category) }

    it { should have_content(category.name) }
    it { should have_title(category.name) }

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

  describe "category/new" do

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

  describe "category/edit" do
    let(:category) { FactoryBot.create(:category) }

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
    before { FactoryBot.create(:user) }
    before { FactoryBot.create(:admin) }

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
      let!(:category) { FactoryBot.create(:category, published: true) }

      before do
        sign_in admin
        visit categories_path
      end

      it { should have_link '', category_path(category) }
    end

  end
end
