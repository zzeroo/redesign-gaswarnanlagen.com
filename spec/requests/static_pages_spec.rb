require 'spec_helper'

describe "StaticPages" do

  let(:base_title) {"RA-GAS GmbH"}

  describe "Home page" do
    it "should have the content 'Redesign gaswarnanlagen.com'" do
        visit '/static_pages/home'
        expect(page).to have_content('Redesign gaswarnanlagen.com')
    end

    it "should have the right title" do
        visit '/static_pages/home'
        expect(page).to have_title("#{base_title} | Home")
    end
  end

  describe "Help page" do
    it "should have the content 'Hilfe'" do
        visit '/static_pages/help'
        expect(page).to have_content('Hilfe')
    end

    it "should have the right title" do
        visit '/static_pages/help'
        expect(page).to have_title("#{base_title} | Hilfe")
    end
  end

  describe "About page" do
    it "should have the content 'Firmenprofil'" do
        visit '/static_pages/about'
        expect(page).to have_content('Firmenprofil')
    end

    it "should have the right title" do
        visit '/static_pages/about'
        expect(page).to have_title("#{base_title} | Firmenprofil")
    end
  end

  describe "Contact page" do
    it "should have the content 'Kontakt'" do
        visit '/static_pages/contact'
        expect(page).to have_content('Kontakt')
    end

    it "should have the right title" do
        visit '/static_pages/contact'
        expect(page).to have_title("#{base_title} | Kontakt")
    end
  end

end
