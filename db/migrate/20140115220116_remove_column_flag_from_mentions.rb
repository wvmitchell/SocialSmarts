class RemoveColumnFlagFromMentions < ActiveRecord::Migration
  def change
    remove_column :mentions, :flag, :boolean
  end
end
