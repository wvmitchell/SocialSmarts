class Tweeter

  attr_reader :client

  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "YSeuV5nQGiBDbtKbrWKdQ"
      config.consumer_secret = "uupuj4BI1hcjIK0cYOt5TKVqUjrSRNrRy4uMTHqxhc"
      config.access_token = user.token
      config.access_token_secret = user.secret
    end
  end

end
