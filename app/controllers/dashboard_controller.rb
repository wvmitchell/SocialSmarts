class DashboardController < ApplicationController

  def index
    redirect_to login_path unless current_user
    if current_user
      # tweeter = TweetFetcher.new
      # @tweets = tweeter.find_tweets_mentioning(current_user.nickname)
      # @klout = KloutFetcher.new
      Mention.add_tweets_for(current_user.nickname)
    end
  end

end
