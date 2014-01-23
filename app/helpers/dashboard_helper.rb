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

  def display_retweet_button(mention)
    image_path = ""
    if mention.retweeted
      image_path = "ss_retweet_on-click.png"
    else
      image_path = "ss_retweet.png"
    end
    link_to image_tag(image_path), {:action => "retweet", :id => mention.id}, method: 'post'
  end

  def display_flagged_button(mention)
    if mention.flagged
      image_path = "ss_flag_on-click.png"
    else
      image_path = "ss_flag.png"
    end
    link_to image_tag(image_path), {:action => "flag", :id => mention.id}, {class: 'flag_link', method: 'post'}
  end

  def display_reply_button(mention)
    if mention.responded
      image_path = "ss_reply_on-click.png"
    else
      image_path = "ss_reply.png"
    end
    link_to image_tag(image_path), "#", {:class => 'respond_link'}
  end

  def display_archive_button(mention)
    if mention.archived
      image_path = "ss_archive_on-click.png"
    else
      image_path = "ss_archive.png"
    end
    link_to image_tag(image_path), {:action => "archive", :id => mention.id}, {class: 'archive_link', method: 'post'}
  end

end
