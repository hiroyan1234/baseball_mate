class AddColumnsToEnters < ActiveRecord::Migration[6.1]
  def change
    add_column :enters, :user_id, :integer
    add_column :enters, :room_id, :integer
  end
end
