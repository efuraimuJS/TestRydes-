class AddAvatarUrlPicToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avatar_url_pic, :string
  end
end
