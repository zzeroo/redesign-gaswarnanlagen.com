include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end


  factory(:category) do
    published true
    sequence(:name) { |n| "Kategorie #{n}" }
    sequence(:description) { Forgery::LoremIpsum.paragraphs(1) }
    sequence(:product_nr_prefix) {|n| "#{n}00"}
    logo { fixture_file_upload(Rails.root.join('spec', 'support', 'rails.png'), 'image/png') }
  end

  factory(:product_group) do
    published true
    sequence(:name) { |n| "Product Gruppe #{n}" }
    sequence(:description) { Forgery::LoremIpsum.paragraphs(1) }
    sequence(:product_nr_prefix) {|n| "#{n}00"}
    logo { fixture_file_upload(Rails.root.join('spec', 'support', 'rails.png'), 'image/png') }
  end

  factory(:product) do
    sequence(:product_nr) {|n| "%d%02d-%08d" % [n/10, n, n] }
    #product_nr "100-00000001"
    sequence(:description) { Forgery::LoremIpsum.sentence }
    sequence(:short_description) { Forgery::LoremIpsum.sentence }
  end

  factory(:news) do
    sequence(:title) { Forgery::LoremIpsum.sentence }
    sequence(:news_body) { Forgery::LoremIpsum.sentence }
  end

  factory(:bda) do
    name "MyString"
  end
end
