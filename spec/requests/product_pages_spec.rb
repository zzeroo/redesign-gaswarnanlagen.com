require 'spec_helper'

describe "Products pages" do
 
  subject { page }

  describe "index" do

    before do
      product_group = FactoryGirl.create(:product_group)
      FactoryGirl.create(:product )
      visit products_path
    end

    it { should have_title('Produkte') }
    it { should have_content('Produkte') }

    it "should list all products" do
      Product.all.each do |product|
        expect(page).to have_selector('td', text: product.product_nr )
        expect(page).to have_selector('td', text: product.short_description )
        expect(page).to have_selector('td', text: product.description )
      end
    end

    describe "Download links" do
      it { should have_link "CSV", products_path(format: "csv") }
      it { should have_link "Excel", products_path(format: "xls") }
    end

    describe "Import link" do
      it { should have_link('Produkte importieren', new_product_import_path) }
    end

  end
end

