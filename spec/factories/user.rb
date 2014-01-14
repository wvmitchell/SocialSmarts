# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    uid "1"
    name "weesie_b"
    access_token "11111111111"
    access_secret "2222222222"
  end
end
