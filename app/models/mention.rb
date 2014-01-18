require 'digest'

class Mention < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :tweet_id

  def self.add_tweets_for(user)
    tf = TweetFetcher.new(user)
    kf = KloutFetcher.new
    tweets = tf.find_tweets_mentioning
    tweets.each do |tweet|
      m = Mention.new
      m.user_id = user.id
      m.profile_image_uri = tweet.user.profile_image_uri.to_s
      m.username = tweet.user.username
      m.message = tweet.text
      m.klout = kf.get_score_for(tweet.user.username)
      m.tweet_timestamp = tweet.created_at
      m.tweet_id = tweet.id
      m.save
    end
  end

  def self.get_unarchived_mentions_for(user)
    self.where(user_id: user.id, archived: false)
  end

  def self.get_unflagged_mentions_for(user)
    self.where(user_id: user.id, flagged: false)
  end

  def self.get_mentions_for_inbox(user)
    self.where(user_id: user.id, flagged: false, archived: false)
  end

  def send_to_archived
    self.archived = true
    self.save
  end

  def flag
    self.flagged = true
    self.save
  end

  def mark_replied
    self.responded = true
    self.save
  end
end
