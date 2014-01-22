require 'spec_helper'

describe TweetFetcher do

  before(:each) do
    @user = FactoryGirl.build(:user, name: "jsl_demo_07")
    @fetcher = TweetFetcher.new(@user)
  end

  it "returns tweets mentioning user", :vcr do
    tweets = @fetcher.find_tweets_mentioning
    tweets.each do |tweet|
      tweet.text.should match(@user.name)
    end
  end

  it "retweets a mention", :vcr do
    Mention.add_tweets_for(@user)
    m = Mention.first
    @fetcher.retweet_mention(m)
    m.retweeted.should eq(true)
  end

end
