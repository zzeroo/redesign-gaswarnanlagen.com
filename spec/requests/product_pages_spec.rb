require 'spec_helper'

describe "Products pages" do
 
  subject { page }

  describe "index" do

    before do
      product_group = FactoryGirl.create(:product_group)
      FactoryGirl.create(:product, product_group_id: product_group.id)
      visit products_path
    end

    it { should have_title('Produkte') }
    it { should have_content('Produkte') }

    it "should list all products" do
      Product.all.each do |product|
        expect(page).to have_selector('td', text: product.number )
        expect(page).to have_selector('td', text: product.short_description )
        expect(page).to have_selector('td', text: product.description )
        expect(page).to have_selector('td', text: product.product_group.name )
      end
    end
  end
end

