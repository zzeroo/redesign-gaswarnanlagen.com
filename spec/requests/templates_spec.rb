require 'spec_helper'

describe "GET index" do

  subject { page }

  describe "page header" do
    it "should have the right links on the layout" do
      visit root_path
      click_link 'Home'
      expect(page).to have_title('RA-GAS GmbH')
      first(:link, 'Aktuell').click
      expect(page).to have_title('Aktuell')
      click_link 'Firmenprofil'
      expect(page).to have_title('Firmenprofil')
      click_link 'Referenzen'
      expect(page).to have_title('Referenzen')
      click_link 'Vertriebspartner'
      expect(page).to have_title('Vertriebspartner')
      first(:link, 'Kontakt').click
      expect(page).to have_title(full_title('Kontakt'))
    end
  end

  describe "basic look and feel" do

    before { visit root_path }

    it { should have_link('', href: root_path) }

    describe "as non admin user" do
      it { should_not have_link('Produkte', href: products_path) }
      it { should_not have_link('Produkt Gruppen', href: product_groups_path) }
    end

    describe "as admin" do
      let(:admin) { FactoryGirl.create(:admin) }
      before { sign_in admin }

      it { should have_link('Produkte', href: products_path) }
      it { should have_link('Produkt Gruppen', href: product_groups_path) }
    end
  end
end
