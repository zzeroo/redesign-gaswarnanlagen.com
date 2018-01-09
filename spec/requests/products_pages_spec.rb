require 'spec_helper'

# Diese Test stammen von Hartls Rails Tutorial
describe "Products pages" do
  let(:product) { FactoryBot.create(:product) }

  it "should list all products" do
    Product.all.each do |product|
      expect(page).to have_selector("td>a[href='#{product_path(product)}']", text: product.product_nr)
      expect(page).to have_selector('td', text: product.short_description)
      expect(page).to have_selector('td', text: product.description)
    end
  end

end
