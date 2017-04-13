class CreateWorkLogs < ActiveRecord::Migration
  def change
    create_table :work_logs do |t|
      t.integer :student_id
      t.references :lesson, index: true, foreign_key: true
      t.datetime :date
      t.integer :time_spent
      t.boolean :in_school

      t.timestamps null: false
    end

    add_foreign_key :work_logs, :users, column: 'student_id'
  end

end
