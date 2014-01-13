class ChangeArchivedDefaultToFalse < ActiveRecord::Migration
  def change
      change_column :mentions, :archived, :boolean, default: false
  end
end
