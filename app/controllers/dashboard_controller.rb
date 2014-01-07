class DashboardController < ApplicationController

  def index
    redirect_to login_path unless current_user
    if current_user
      raise current_user.nickname
      tweeter = TweetFetcher.new
      @tweets = tweeter.find_tweets_mentioning(current_user.nickname)
    end
  end

end
