class CreateTagCenters < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_centers do |t|

      t.timestamps
    end
  end
end
