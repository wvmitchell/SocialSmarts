class AddColumnTweetIdToMentions < ActiveRecord::Migration
  def change
    add_column :mentions, :tweet_id, :integer
  end
end
