require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    it "should have the content 'Redesign gaswarnanlagen.com'" do
        visit '/static_pages/home'
        expect(page).to have_content('Redesign gaswarnanlagen.com')
    end

    it "should have the right title" do
        visit '/static_pages/home'
        expect(page).to have_title("RA-GAS GmbH | Home")
    end
  end

  describe "Help page" do
    it "should have the content 'Hilfe'" do
        visit '/static_pages/help'
        expect(page).to have_content('Hilfe')
    end

    it "should have the right title" do
        visit '/static_pages/help'
        expect(page).to have_title("RA-GAS GmbH | Hilfe")
    end
  end

  describe "About page" do
    it "should have the content 'Über uns'" do
        visit '/static_pages/about'
        expect(page).to have_content('Über uns')
    end

    it "should have the right title" do
        visit '/static_pages/about'
        expect(page).to have_title("RA-GAS GmbH | Über uns")
    end
  end

end
