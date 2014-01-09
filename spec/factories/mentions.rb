# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mention do
    user_id 1
    klout 10
    profile_image_uri ""
    message "Here is a Tweet"
  end
end
