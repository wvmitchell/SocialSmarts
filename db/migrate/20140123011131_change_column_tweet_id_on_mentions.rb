class ChangeColumnTweetIdOnMentions < ActiveRecord::Migration
  def change
    change_column :mentions, :tweet_id, :bigint
  end
end
