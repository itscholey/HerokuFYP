class CreateActionitemassignees < ActiveRecord::Migration
  def change
    create_table :actionitemassignees do |t|
      t.references :actionitem, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
