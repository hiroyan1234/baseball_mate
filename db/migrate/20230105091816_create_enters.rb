class CreateEnters < ActiveRecord::Migration[6.1]
  def change
    create_table :enters do |t|

      t.timestamps
    end
  end
end
