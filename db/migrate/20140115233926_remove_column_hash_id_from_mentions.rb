class RemoveColumnHashIdFromMentions < ActiveRecord::Migration
  def change
    remove_column :mentions, :hash_id, :string
  end
end
