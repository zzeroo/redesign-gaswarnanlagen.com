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

  factory(:product) do
    sequence(:product_nr) { |n| "%d%02d-%08d" % [n/10, n, n] }
    sequence(:description) { Forgery::LoremIpsum.sentence }
    sequence(:short_description) { Forgery::LoremIpsum.paragraphs(1) }
    sequence(:short_text1) { Forgery::LoremIpsum.sentence }
    sequence(:short_text2) { Forgery::LoremIpsum.sentence }
  end

  factory(:news) do
    sequence(:title) { Forgery::LoremIpsum.sentence }
    sequence(:news_body) { Forgery::LoremIpsum.sentence }
  end

  factory(:bda) do
    sequence(:name) { |n| "Bda #{n}" }
    sequence(:description) { Forgery::LoremIpsum.paragraphs(1) }
    sequence(:product_nr_prefix) { |n| "#{n}00"}
  end
end
