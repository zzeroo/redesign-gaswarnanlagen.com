FactoryGirl.define do
  factory :document do
    title "Dokument Titel"
    desc "Dokument Beschreibung"

    # sequence(:title) { Forgery::LoremIpsum.sentence }
    # sequence(:body) { Forgery::LoremIpsum.sentence }
  end
end
