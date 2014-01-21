module DashboardHelper

  def display_klout_score(mention)
    score = mention.klout
    score ? score.round : 'n/a'
  end

  def pretty_time(mention)
    if ((Time.now).minus_with_coercion(mention.tweet_timestamp)/3600).round > 3
      time = " Tweet #{time_ago_in_words(Time.at(mention.tweet_timestamp).to_formatted_s(:long_ordinal))} ago "
    else
      time = Time.at(mention.tweet_timestamp).to_formatted_s(:long_ordinal)
    end
    time
  end
end
