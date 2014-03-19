require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      sign_in user
      visit users_path
    end

    it { should have_title('Alle Benutzer') }
    it { should have_content('Alle Benutzer')}

    describe "pagination" do
      
      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all) { User.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each user" do
        User.paginate(page: 1).each do |user|
          expect(page).to have_selector('li', text: user.name)
        end
      end
    end

    describe "delete links" do

      it { should_not have_link('löschen') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end

        it { should have_link('löschen', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect do
            click_link('löschen', match: :first)
          end.to change(User, :count).by(-1)
        end
        it { should_not have_link('löschen', href: user_path(admin)) }

      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "Users signedin should not see signin link" do
    it { should_not have_link('Sign in') }
  end

  describe "Users signedin should not see signup link" do
    it { should_not have_link('Sign up') }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Anmeldung') }
    it { should have_title(full_title('Anmeldung')) }

    describe "Link to signin alternative" do
      it { should have_link('Sign in', signin_path) }
    end
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Benutzerzugang erstellen" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_title('Anmeldung') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Bestätigung", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Willkommen') }
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Willkommen') }
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("Profil bearbeiten") }
      it { should have_title("Profil bearbeiten") }
      it { should have_link('Benutzerbild ändern', href: 'http://gravatar.com/emails') }

      describe "Link to change gravatar should open in new window or tab" do
        it { find_link('Benutzerbild ändern')[:target].should == '_blank' }
      end
    end

    describe "with invalid information" do
      before { click_button "Änderungen speichern" }

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name) { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Bestätigung", with: user.password
        click_button "Änderungen speichern"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end

    describe "forbidden attributes" do
      let(:params) do
        { user: { admin: true, password: user.password,
                  password_confirmation: user.password } }
      end
      before do
        sign_in user, no_capybara: true
        patch user_path(user), params
      end
      specify { expect(user.reload).not_to be_admin }
    end
  end

  describe "destroy" do
    let(:admin) { FactoryGirl.create(:admin) }

    before { sign_in admin, no_capybara: true }

    it "admin can't destroy him self" do
      expect do
        delete user_path(admin)
      end.to_not change(User, :count).by(-1)
    end
  end
end
