class MentionFetcherWorker

  @queue = :mention_fetch

  def self.perform(user_id)
    Mention.add_tweets_for(User.find(user_id))
  end

end
