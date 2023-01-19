class RenameTypeToPostTypeInPlayerPost < ActiveRecord::Migration[6.1]
  def change
    rename_column :player_posts, :type, :post_type
  end
end
