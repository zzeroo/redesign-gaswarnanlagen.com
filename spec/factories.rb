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


  factory(:product_group) do
    sequence(:name) { |n| "Product Gruppe #{n}" }
    sequence(:description) { Forgery::LoremIpsum.paragraphs(1) }
  end

  factory(:product) do
    sequence(:number) { |n| "123-0101#{"%04d" % n}" }
    sequence(:description) { Forgery::LoremIpsum.sentence }
    sequence(:short_description) { Forgery::LoremIpsum.sentence }
  end
end
