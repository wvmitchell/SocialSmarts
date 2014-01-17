class RemoveColumnsFromMention < ActiveRecord::Migration
  def change
    remove_column :mentions, :should_respond, :boolean
  end
end
