require 'spec_helper'

describe "StaticPages" do

  let(:base_title) {"RA-GAS GmbH"}

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  subject { page }

  describe "Home page" do
    before { visit root_path }
    let(:heading)     { 'RA-GAS' }
    let(:page_title)  { ''}

    it { should_not have_title("| Home") }

    describe "Signup button if not signed in" do
      it { should have_link('Sign in') }
    end

    describe "No signup button if signed in" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }
      before { visit root_path }

      it { should_not have_link('Anmelden!') }
    end

    describe "product categories on home page" do
      let!(:category) { FactoryGirl.create(:category, published: true) }
      before { visit root_path }

      it { should have_content(category.name) }
      it { should have_content(category.description) }

      describe "non published category" do
        let!(:non_published_category) { FactoryGirl.create(:category, published: false) }
        before { visit root_path }

        it { should_not have_content(non_published_category.name) }
      end
    end
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)     { 'Mehr Sicherheit durch RA-GAS Warnsysteme' }
    let(:page_title)  { 'Firmenprofil' }

    it_should_behave_like "all static pages"
  end

  describe "References page" do
    before { visit references_path }
    let(:heading)     { 'Referenzen' }
    let(:page_title)  { 'Referenzen' }

    it_should_behave_like "all static pages"
  end

  describe "Distributors page" do
    before { visit  distributors_path }
    let(:heading)     { 'Vertriebspartner' }
    let(:page_title)  { 'Vertriebspartner' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)     { 'Kontakt' }
    let(:page_title)  { 'Kontakt' }

    it_should_behave_like "all static pages"
  end

end
