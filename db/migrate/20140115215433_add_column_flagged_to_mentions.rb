class AddColumnFlaggedToMentions < ActiveRecord::Migration
  def change
    add_column :mentions, :flagged, :boolean, default: false
  end
end
