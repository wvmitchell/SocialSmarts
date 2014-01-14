# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mention do
    user_id 1
    username 'jhallman'
    tweet_timestamp Time.now
    klout 10
    profile_image_uri "http://www.google.com"
    message "This is a Tweet"
    sequence(:hash_id) {|n| n }
  end
end
