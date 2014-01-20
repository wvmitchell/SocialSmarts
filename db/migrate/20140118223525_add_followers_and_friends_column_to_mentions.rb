class AddFollowersAndFriendsColumnToMentions < ActiveRecord::Migration
  def change
    add_column :mentions, :followers_count, :integer
    add_column :mentions, :friends_count, :integer
  end
end
