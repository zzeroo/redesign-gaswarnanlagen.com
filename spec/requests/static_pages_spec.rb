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

    it_should_behave_like "all static pages"
    it { should_not have_title("| Home") }

    describe "Signup button if not signed in" do
      it { should have_link('Anmelden!') }
    end

    describe "No signup button if signed in" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }
      before { visit root_path }

      it { should_not have_link('Anmelden!') }
    end
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)     { 'Hilfe' }
    let(:page_title)  { 'Hilfe' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)     { 'Firmenprofil' }
    let(:page_title)  { 'Firmenprofil' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)     { 'Kontakt' }
    let(:page_title)  { 'Kontakt' }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Home"
    click_link "Hilfe"
    expect(page).to have_title(full_title('Hilfe'))
    click_link "Sign in"
    click_link "Über uns"
    expect(page).to have_title(full_title('Firmenprofil'))
    click_link "Kontakt"
    expect(page).to have_title(full_title('Kontakt'))
  end
end
