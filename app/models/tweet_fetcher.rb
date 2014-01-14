class TweetFetcher

  attr_reader :client

  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["CONSUMER_KEY"]
      config.consumer_secret = ENV["CONSUMER_SECRET"]
      config.access_token = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["TOKEN_SECRET"]
    end
  end

  def find_tweets_mentioning
    # client.mentions_timeline
    client.search("@wvmitchell")
  end

end
