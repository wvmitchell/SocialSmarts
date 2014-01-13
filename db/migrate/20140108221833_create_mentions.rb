class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.string :hash_id
      t.string :username
      t.float :klout
      t.string :message
      t.datetime :tweet_timestamp
      t.boolean :flag
      t.boolean :should_respond
      t.boolean :responded
      t.boolean :archived
      t.boolean :favorited

      t.timestamps
    end
    add_index :mentions, :hash_id
    add_index :mentions, :archived
  end
end
