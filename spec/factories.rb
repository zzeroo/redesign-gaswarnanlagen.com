FactoryGirl.define do
  factory :user do
    name     "Stefan Müller"
    email    "s.mueller@it.kls-glt.de"
    password "foobar"
    password_confirmation "foobar"
  end
end
