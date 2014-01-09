class AddProfileImageUriToMentions < ActiveRecord::Migration
  def change
    add_column :mentions, :profile_image_uri, :string
  end
end
