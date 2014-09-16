require 'spec_helper'

# Diese Test stammen fon Hartls Rails Tutorial
describe "Products pages" do
  let(:product) { FactoryGirl.create(:product) }

  xit 'should have products' do
    Product.all.size.should eq(1)
  end

  it "should list all products" do
    Product.all.each do |product|
      expect(page).to have_selector("td>a[href='#{product_path(product)}']", text: product.product_nr)
      expect(page).to have_selector('td', text: product.short_description)
      expect(page).to have_selector('td', text: product.description)
    end
  end

  describe "Product admin links" do
    xit 'should have a "löschen" link' do
      should have_link('löschen')
    end
  end
end
