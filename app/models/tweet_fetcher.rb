class TweetFetcher

  attr_reader :client

  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "YSeuV5nQGiBDbtKbrWKdQ"
      config.consumer_secret = "uupuj4BI1hcjIK0cYOt5TKVqUjrSRNrRy4uMTHqxhc"
      config.access_token = user.access_token
      config.access_token_secret = user.access_secret
    end
  end

  def find_tweets_mentioning
    client.mentions_timeline
  end

end
