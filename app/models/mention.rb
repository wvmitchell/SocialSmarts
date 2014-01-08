require 'digest'

class Mention < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :hash_id

  def self.add_tweets_for(user)
    tf = TweetFetcher.new
    kf = KloutFetcher.new
    tweets = tf.find_tweets_mentioning(user)
    tweets.each do |tweet|
      m = Mention.new
      m.username = tweet.user.username
      m.message = tweet.text
      m.klout = kf.get_score_for(user)
      m.hash_id = Digest::SHA1.hexdigest(m.username + m.message)
      m.tweet_timestamp = tweet.created_at
      m.save
    end
  end

end
