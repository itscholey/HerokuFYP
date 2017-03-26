class CreateActionplans < ActiveRecord::Migration
  def change
    create_table :actionplans do |t|
      t.string :title
      t.string :description
      t.integer :student_id
      t.integer :supervisor_id
      t.timestamps null: false
    end
    add_foreign_key :actionplans, :users, column: 'student_id'
    add_foreign_key :actionplans, :users, column: 'supervisor_id'
  end
end
