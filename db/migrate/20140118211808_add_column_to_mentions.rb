class AddColumnToMentions < ActiveRecord::Migration
  def change
    add_column :mentions, :retweeted, :boolean, default: false
  end
end
