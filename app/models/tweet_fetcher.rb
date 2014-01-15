class TweetFetcher

  attr_reader :client

  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["CONSUMER_KEY"]
      config.consumer_secret = ENV["CONSUMER_SECRET"]
      config.access_token = user.access_token
      config.access_token_secret = user.access_secret
    end
  end

  def find_tweets_mentioning
    client.mentions_timeline
  end

  # client.retweet(*tweets)
  # Twitter::Tweet

  # 1. Pass the mention to the function
  # 2. Create the tweet object based on the mention.tweet_id
  # 3. Retweet the tweet, using the client.retweet(tweet)

  def retweet_mention(mention)
    client.retweet(mention.tweet_id)
  end

end
