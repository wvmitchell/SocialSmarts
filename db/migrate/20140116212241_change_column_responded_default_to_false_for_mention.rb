class ChangeColumnRespondedDefaultToFalseForMention < ActiveRecord::Migration
  def change
    change_column :mentions, :responded, :boolean, default: false
  end
end
