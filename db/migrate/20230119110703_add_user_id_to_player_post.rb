class AddUserIdToPlayerPost < ActiveRecord::Migration[6.1]
  def change
    add_column :player_posts, :user_id, :integer
  end
end
