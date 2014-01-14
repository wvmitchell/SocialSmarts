require 'spec_helper'

describe TweetFetcher do

  before(:each) do
    @user = FactoryGirl.build(:user)
    @fetcher = TweetFetcher.new(@user)
  end

  it "returns tweets mentioning user", :vcr do
    tweets = @fetcher.find_tweets_mentioning
    tweets.first.class.should eq(Twitter::Tweet)
    tweets.each do |tweet|
      tweet.text.should match(@user)
    end
  end

end
