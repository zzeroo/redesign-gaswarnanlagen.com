require 'spec_helper'

describe "GET index" do

  subject { page }

  describe "page header" do
    it "should have the right links on the layout" do
      visit root_path
      click_link( 'Home', match: :first)
      expect(page).to have_title('RA-GAS GmbH')
      first(:link, 'Aktuell').click
      expect(page).to have_title('Aktuell')
      click_link 'Firma'
      expect(page).to have_title('Firmenprofil')
      click_link 'Referenzen'
      expect(page).to have_title('Referenzen')
      click_link 'Vertrieb'
      expect(page).to have_title('Vertriebspartner')
      first(:link, 'Kontakt').click
      expect(page).to have_title(full_title('Kontakt'))
    end
  end

  describe "'Administation' menu" do

    describe "as admin" do
      let(:admin) { FactoryBot.create(:admin) }
      before { sign_in admin }

      it { should have_link("Aktuell", href: news_index_path) }
      it { should have_link("Produkte", href: products_path) }
      it { should have_link("Produkt-Kategorien", href: categories_path) }
      it { should have_link("BDA's", href: bdas_path) }

    end
  end
end
