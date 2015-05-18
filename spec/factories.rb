FactoryGirl.define do
  factory :oauth_application do
    name          Faker::Company.name
    secret        Faker::Lorem.characters(60)
    redirect_uri  Faker::Internet.url
  end
  factory :guessing_game_instance do
    user_id           "1"
    guessing_game_id  "1"
    answer            Faker::Number.digit
    active            "1"
  end
end