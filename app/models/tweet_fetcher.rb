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

  def retweet_mention(mention)
    client.retweet(mention.tweet_id)
    mention.retweeted = true
    mention.save
  end

  def reply_to_mention(mention, message)
    client.update("@#{mention.username} #{message}", :in_reply_to_status_id => mention.tweet_id)
  end

end
