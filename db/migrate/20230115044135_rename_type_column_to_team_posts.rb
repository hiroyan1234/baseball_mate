class RenameTypeColumnToTeamPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :team_posts, :type, :post_type
  end
end
