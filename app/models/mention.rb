  require 'digest'

class Mention < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :hash_id

  def self.add_tweets_for(user)
    tf = TweetFetcher.new
    kf = KloutFetcher.new
    tweets = tf.find_tweets_mentioning(user.nickname)
    tweets.each do |tweet|
      m = Mention.new
      m.user_id = user.id
      m.profile_image_uri = tweet.user.profile_image_uri.to_s
      m.username = tweet.user.username
      m.message = tweet.text
      m.klout = kf.get_score_for(tweet.user.username)
      m.hash_id = Digest::SHA1.hexdigest(m.username + m.message)
      m.tweet_timestamp = tweet.created_at
      m.save
    end
  end

  def self.get_latest_mentions_for(user)
    self.where(user_id: user.id)
  end

  def pretty_time
    time = Time.at(tweet_timestamp).to_formatted_s(:long_ordinal)
  end

  def send_to_archived
    self.archived = true
    self.save
  end
end
