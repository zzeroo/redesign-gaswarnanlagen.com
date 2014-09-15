require 'spec_helper'

feature "Bda links" do
  let!(:product) { FactoryGirl.create(:product) }

   scenario "links are constucted well" do
     visit "/products"

     expect(page).to have_text("Download")
   end
end
