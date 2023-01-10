class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      
      t.integer :user_id
      t.string :name
      t.integer :age
      t.string :introduction
      t.timestamps
    end
  end
end
