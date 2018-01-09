require 'spec_helper'

# Diese Test stammen fon Hartls Rails Tutorial
describe "Products pages" do

  let(:admin)    { FactoryBot.create(:admin) }
  let(:category) { FactoryBot.create(:category) }
  let(:product)  { FactoryBot.create(:product) }

  subject { page }

  describe "GET /products" do
    before(:each) do
      visit products_path
    end

    it { should have_title('Produkte') }
    it { should have_content('Produkte') }

    describe "As admin" do
      before(:each) do
        sign_in admin
        visit products_path
      end

      describe "Import link" do
        it { should have_link('Produkte importieren', href: new_product_import_path) }
      end
    end

  end
end
