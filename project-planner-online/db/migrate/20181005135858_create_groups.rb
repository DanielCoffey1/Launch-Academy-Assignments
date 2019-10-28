class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.belongs_to :user_id, null: false
      t.belongs_to :project_id, null: false

      t.timestamps null: false
    end
  end
end
