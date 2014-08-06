require 'spec_helper'

describe "Products pages" do
 
  let(:admin)    { FactoryGirl.create(:admin) }
  let(:category) { FactoryGirl.create(:category) }
  let(:product)  { FactoryGirl.create(:product ) }

  subject { page }

  describe "index" do

    before do
      visit products_path
    end

    it { should have_title('Produkte') }
    it { should have_content('Produkte') }

    it "should list all products" do
      Product.all.each do |product|
        expect(page).to have_selector("td>a[href='#{product_path(product)}']", text: product.product_nr )
        expect(page).to have_selector('td', text: product.short_description )
        expect(page).to have_selector('td', text: product.description )
      end
    end

    describe "As admin" do
      before do
        sign_in admin
        visit products_path
      end

      describe "Import link" do
        it { should have_link('Produkte importieren', href: new_product_import_path) }
      end
    end

  end
end

