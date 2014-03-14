require 'spec_helper'

describe "StaticPages" do

  let(:base_title) {"RA-GAS GmbH"}

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('RA-GAS') }
    it { should have_title(full_title('')) }
    it { should_not have_title("| Home") }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Hilfe')}
    it { should have_title(full_title('Hilfe')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('Firmenprofil')}
    it { should have_title(full_title('Firmenprofil')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Kontakt')}
    it { should have_title(full_title('Kontakt')) }
  end

end
