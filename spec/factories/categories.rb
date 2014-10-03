include ActionDispatch::TestProcess

FactoryGirl.define do
  factory(:category) do
    published true
    sequence(:name) { |n| "Kategorie #{n}" }
    sequence(:description) { Forgery::LoremIpsum.paragraphs(1) }
    sequence(:product_nr_prefix) { |n| "#{n}00" }
    logo { fixture_file_upload(Rails.root.join('spec', 'support', 'rails.png'), 'image/png') }
    background_color "#FFFFFF"
  end

end
