class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.belongs_to :friend, null: false
      t.belongs_to :party, null: false

      t.timestamps null: false
    end
  end
end
