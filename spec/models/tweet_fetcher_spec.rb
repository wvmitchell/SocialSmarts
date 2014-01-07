require 'spec_helper'

describe TweetFetcher do
  it "returns tweets mentioning user" do
    fetcher = TweetFetcher.new
    user = 'weesie_b'
    tweets = fetcher.find_tweets_mentioning(user)
    tweets.first.class.should eq(Twitter::Tweet)
    tweets.each do |tweet|
      tweet.text.should match(user)
    end
  end
end
