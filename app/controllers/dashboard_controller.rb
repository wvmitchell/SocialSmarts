class DashboardController < ApplicationController

  def index
    redirect_to login_path unless current_user
    # @mentions = current_user.mentions
    if current_user
      Mention.add_tweets_for(current_user)
      @mentions = Mention.get_latest_mentions_for(current_user)
    end
  end

end
