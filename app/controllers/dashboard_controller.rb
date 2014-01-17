class DashboardController < ApplicationController

  def index
    redirect_to login_path unless current_user
    if current_user
      Mention.add_tweets_for(current_user)
      @mentions = Mention.get_unarchived_mentions_for(current_user)
    end
  end

  def archive
    Mention.find(params[:id]).send_to_archived
    redirect_to home_path
  end

  def retweet
    mention = Mention.find(params[:id])
    tf = TweetFetcher.new(current_user)
    tf.retweet_mention(mention)
    redirect_to home_path
  end

  def flag
    Mention.find(params[:id]).flag
    redirect_to home_path
  end

  def reply
    mention = Mention.find(params[:id])
    tf = TweetFetcher.new(current_user)
    if tf.reply_to_mention(mention, params[:respond])
      mention.mark_replied
    end
    redirect_to home_path
  end

  def archived_page
    @mentions = Mention.where(archived: true, user_id: current_user.id)
  end

  def flagged_page
    @mentions = Mention.where(flagged: true, user_id: current_user.id)
  end

  def replied_to
    @mentions = Mention.where(responded: true, user_id: current_user.id)
  end

end
